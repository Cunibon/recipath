# 🍳 ReciPath — Recipes, Shopping, Storage and Charts

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Cunibon/recipath?style=social)](https://github.com/Cunibon/recipath/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/Cunibon/recipath)](https://github.com/Cunibon/recipath/issues)

**ReciPath** is an open-source, local-first recipe app. Recipes turn into shopping lists, ticked-off items land in your storage, and cooked recipes feed a dashboard. Everything lives in a local SQLite database; syncing through Supabase (ours or your own) is optional.

Available for [Android](https://play.google.com/store/apps/details?id=com.cunibongames.recipath) and [iOS](https://apps.apple.com/app/id6791212568), in English, German, Spanish and French.

---

## Features

- 📖 **Recipes** — Steps with their own ingredients, images, tags and per-step timers.
- 🛒 **Shopping** — Plan a trip by picking recipes, or add items directly with quick shopping. Tick things off as you go.
- 🥫 **Storage** — Ticked-off items land in your storage. Recipes and the shopping list highlight what you already have.
- 🏷️ **Tags & filters** — Tag recipes and groceries, then filter and search recipes, groceries, shopping and storage.
- 📷 **Barcode scan** — Fill in grocery data and nutriments from [Open Food Facts](https://openfoodfacts.org). Connect your account to contribute missing products.
- 🤖 **AI import** — Import recipes from a URL or a photo using your own API key (Google Gemini, Anthropic Claude, Mistral, Moonshot Kimi or OpenAI). Existing groceries and tags are reused.
- 📤 **Share & export** — Share recipes as `.recipath` files or PDF, and export or import your data as a file.
- 📈 **Charts** — What you cooked, which ingredients it took and how many calories that was.
- ☁️ **Syncing** — Use your data on multiple devices.

---

## Free vs. Pro

Without an account everything works locally. Pro only decides how much is synced.

| | Free | Pro | Own backend |
|---------|------|-----|-----|
| All features locally | ✅ | ✅ | ✅ |
| Cloud sync | Groceries & shopping | Everything | Everything |
| Price | Free | 4.99€ a year | Your Supabase bill |

Pointing the app at your own Supabase instance disables the subscription entirely.

---

## Using the app

### 1. Create recipes
- Add a title and maybe an image
- Add steps and their respective ingredients
    - Groceries are shared across all recipes and live in the Groceries screen
    - The normal amount (the quantity you would buy) determines how many need to be bought
    - Conversion rate and nutriments are what make the dashboard accurate
    - The barcode scanner at the top right fills in most values for you
- Or skip all of that: import from a URL, a photo or a `.recipath` file

### 2. Shop
Swipe a recipe or tap the shopping button to enter shopping mode. Select the recipes you want to cook and their ingredients are added to the Shopping screen. Past plans are in the shopping history.

### 3. Keep track of what you have
Everything you tick off is added to Storage. Shopping and Recipes highlight ingredients you have at home.

### 4. Cook
Open a recipe and start the timer. Your time is recorded and the average shows up on the recipe.

---

## Tech Stack

- **App:** Flutter, version pinned through [FVM](https://fvm.app) in `.fvmrc`
- **State:** Riverpod with code generation, freezed models
- **Local database:** drift (SQLite)
- **Routing:** go_router
- **Backend:** Supabase (Postgres, auth, storage for recipe images)
- **AI import:** genkit
- **Subscriptions:** RevenueCat
- **Crash reporting:** Sentry

---

## Building

```bash
fvm flutter pub get
fvm flutter run -t lib/main_fdroid.dart
```

That is the build without store purchases or a default backend. It needs no keys and runs fully local, with everything unlocked.

The store build is `lib/main.dart` and reads its keys from a git-ignored `config.env`:

```
SUPABASE_URL=
SUPABASE_KEY=
REVENUECAT_ANDROID_KEY=
REVENUECAT_APPLE_KEY=
SENTRY_URL=
```

```bash
fvm flutter run --dart-define-from-file=config.env
```

Every key is optional. Without the Supabase pair there is no default backend, and Sentry only starts outside debug mode with `SENTRY_URL` set.

Generated code (`*.g.dart`, `*.freezed.dart`, l10n) is committed. After changing models, providers or tables:

```bash
fvm dart run build_runner build
```

`scripts/fdroid_prebuild.sh` is for the F-Droid build server. It rewrites `pubspec.yaml` and the Android manifest to drop RevenueCat and compile SQLite from source, so don't run it in a working tree you care about.

---

## Self-hosting the backend

The schema, RLS policies and the recipe image bucket are in `supabase/migrations`.

```bash
supabase link --project-ref <your-project>
supabase db push
```

Then enter the project URL and publishable key under **Settings → Supabase Config**. Switching backends signs you out and wipes the local data, so export first.

---

## Project layout

```
lib/
  data/            freezed models
  drift/           tables and migrations for the local database
  repos/           queries on top of drift
  application/     modifiers, the write side
  domain_service/  backend (auth, remote store), syncing, subscription, Open Food Facts
  widgets/         screens, navigation, generic widgets
  l10n/            arb files
supabase/          config and migrations
test/
  screenshots/     golden tests that render the store screenshots
  ai/              AI import tests, see test/ai/README.md
```

Auth, remote store and subscription sit behind interfaces with no-op implementations. That is what lets the app run without a backend or a store.

---

## Tests

```bash
fvm flutter test --exclude-tags live
```

The `live` tag runs real AI imports against each provider and needs API keys. Details are in [test/ai/README.md](test/ai/README.md).

---

## Contributing

Bug reports, feature requests and pull requests are welcome.

---

## License

This project is licensed under the [MIT License](LICENSE).
