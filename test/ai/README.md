# AI import tests

One live matrix test that runs a real extraction against every configured provider and asserts the
result is structurally usable. Tagged `live`, so it never runs in a normal `flutter test`.

## Providers

Every provider runs its `AiProviderEnum.defaultModel`. There is no per-run model override — to test a
different model, change `defaultModel` in `lib/data/ai_provider_enum.dart`, so what the test exercises
is always exactly what the app ships.

| provider | JSON key | env var | model | get a key |
|---|---|---|---|---|
| Google Gemini | `google` | `RECIPATH_GOOGLE_TOKEN` | `gemini-3.5-flash-lite` | [aistudio.google.com](https://aistudio.google.com/app/apikey) |
| Anthropic Claude | `anthropic` | `RECIPATH_ANTHROPIC_TOKEN` | `claude-sonnet-4-6` | [platform.claude.com](https://platform.claude.com/settings/keys) |
| Mistral AI | `mistral` | `RECIPATH_MISTRAL_TOKEN` | `mistral-small-latest` | [console.mistral.ai](https://console.mistral.ai/api-keys/) |
| Moonshot Kimi | `moonshot` | `RECIPATH_MOONSHOT_TOKEN` | `kimi-k2.6` | [platform.kimi.ai](https://platform.kimi.ai/console/api-keys) |
| OpenAI | `openAi` | `RECIPATH_OPENAI_TOKEN` | `gpt-5.4-mini` | [platform.openai.com](https://platform.openai.com/api-keys) |

## Tokens

Read in this order: `--dart-define=RECIPATH_AI_TOKENS`, then the env var above, then
`test/ai/tokens.local.json` (git-ignored). JSON keys are the `AiProviderEnum` value names — note the
camelCase `openAi`.

```json
{
  "google": "AIza...",
  "anthropic": "sk-ant-...",
  "mistral": "...",
  "moonshot": "sk-...",
  "openAi": "sk-..."
}
```

Include only the providers you have keys for. A missing entry skips that provider with the env var to
set; an entry left as a placeholder (under 16 characters, or containing `...`) skips with a note rather
than firing a doomed request, so a partial matrix stays readable and honest.

## Running

```bash
# every configured provider
fvm flutter test test/ai/live_matrix_test.dart --tags live

# one provider, verbose — the fast iteration loop
fvm flutter test test/ai/live_matrix_test.dart --tags live --name 'Anthropic' -r expanded

# tokens from the shell instead of the file
RECIPATH_OPENAI_TOKEN=sk-... \
  fvm flutter test test/ai/live_matrix_test.dart --tags live --name 'OpenAI'

# everything except live (goldens only)
fvm flutter test --exclude-tags live
```

## Coverage

The app has two import paths; the URL one has two branches. All three are exercised per provider:

| case | what it proves |
|---|---|
| `url import` | a page with no structured data → `RecipeContentExtractor` html-to-text fallback |
| `url import (json-ld)` | a realistic page with several `ld+json` blocks and the Recipe inside an `@graph` — the shape virtually every real recipe site emits, and the branch the app actually takes in production |
| `image import` | base64 JPEG → the provider's vision path |

Two `RecipeContentExtractor` cases also run without any token, since they cost nothing: they assert
JSON-LD wins when present, and that the fallback strips scripts and page chrome.

### The image fixture

There is no committed photo. `renderRecipeCard` (`support/recipe_card.dart`) draws
`fixtures/sample_recipe.txt` onto a 1000px-wide card with `package:image` and encodes baseline JPEG, so
the image always matches the text fixture and no binary lives in the repo.

That tests the vision *plumbing* — base64 encoding, `media_type`, the multimodal wire format, and the
model reading text off an image. It does **not** reproduce a real photo: no perspective, no lighting,
no glare, no handwriting. To test that, drop a real photo at `test/ai/fixtures/sample_recipe.jpg` and
it is used instead of the generated card, no code change needed.

## What it runs

Not a stub of the import — the import. Each case builds a `ProviderContainer` with an in-memory
drift database seeded from the screenshot fixture (30 groceries, real tags), overrides
`aiProviderProvider` with the test token, and then calls the app's own mutation:

```dart
AiImportMutation.runUrlImport(world.container, server.url)
```

So a run exercises `RecipePromptBuilder` (the real ~80-line system prompt, with the seeded grocery and
tag lists interpolated into it), `RecipeContentExtractor` against a local HTTP server serving an HTML
recipe page, genkit, the live provider, and `AiImportMutation.parseResult`.

## What it asserts

- the response was not truncated (`finishReason` is not `length`)
- every ingredient `groceryId` resolves to a grocery
- every `unit` and `conversionUnit` is in the schema's enum
- no unit text embedded in a grocery name (`Butter (g)`)
- `normalAmount` is stamped
- every `recipeTags.recipeId` resolves to a recipe
- every recipe has a title and at least one step
- **any grocery or tag matching one the user already has is copied character for character** — the
  prompt's highest-value rule, and the one that silently creates duplicates when it breaks
- **at least one grocery and one tag were reused** — zero reuse means the model ignored the lists, or
  `RecipePromptBuilder` stopped interpolating them into the prompt at all

The fixture recipe (`fixtures/sample_recipe.txt`) is deliberately in-domain for the seeded pantry — an
Asian chicken main course, against a pantry built around Chicken teriyaki with `Asian` / `Main course`
/ `Meat` among the seeded tags. That overlap is what gives the reuse assertions teeth; an out-of-domain
recipe matches nothing and the checks pass vacuously. Keep that in mind before swapping it.

Each pass prints a one-line summary; failures dump the full parsed result.

```
1 recipe(s), 9 steps, 12 groceries (12 reused), 3 tags (3 reused) in 29709ms
```

To enable image extraction, drop a photo of a recipe at `test/ai/fixtures/sample_recipe.jpg`.
