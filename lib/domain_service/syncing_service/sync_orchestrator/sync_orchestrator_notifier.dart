import 'package:recipath/domain_service/syncing_service/repos/sync_repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/grocery_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/ingredient_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/recipe_shopping_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/recipe_statistic_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/recipe_step_ingredient_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/recipe_step_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/recipe_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/recipe_tag_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/shopping_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/storage_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/tag_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipath/repos/grocery/full_grocery_repo_notifier.dart';
import 'package:recipath/repos/ingredient_repo/ingredient_repo_notifier.dart';
import 'package:recipath/repos/recipe/drift/full_recipe_repo_notifier.dart';
import 'package:recipath/repos/recipe_shopping/recipe_shopping_repo_notifier.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:recipath/repos/recipe_step_ingredient_repo/recipe_step_ingredient_repo_notifier.dart';
import 'package:recipath/repos/recipe_step_repo/recipe_step_repo_notifier.dart';
import 'package:recipath/repos/recipe_tag/full_recipe_tag_repo_notifier.dart';
import 'package:recipath/repos/shopping/full_shopping_repo_notifier.dart';
import 'package:recipath/repos/storage/full_storage_repo_notifier.dart';
import 'package:recipath/repos/tag/full_tag_repo_notifier.dart';
import 'package:recipath/widgets/providers/revenue_cat/revenue_pro_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_orchestrator_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<SyncOrchestrator> syncOrchestratorNotifier(Ref ref) async {
  final pro = await ref.watch(revenueProProvider.future);
  final supabaseClient = ref.watch(supabaseClientProvider);

  final groceryRepo = ref.watch(fullGroceryRepoProvider);
  final ingredientRepo = ref.watch(ingredientRepoProvider);
  final shoppingRepo = ref.watch(fullShoppingRepoProvider);

  final recipeRepo = ref.watch(fullRecipeRepoProvider);
  final recipeStepRepo = ref.watch(recipeStepRepoProvider);
  final recipeStepIngredientRepo = ref.watch(recipeStepIngredientProvider);

  final tagRepo = ref.watch(fullTagRepoProvider);
  final recipeTagRepo = ref.watch(fullRecipeTagRepoProvider);

  final storageRepo = ref.watch(fullStorageRepoProvider);

  final recipeStatisticRepo = ref.watch(recipeStatisticsRepoProvider);
  final recipeShoppingRepo = ref.watch(recipeShoppingRepoProvider);

  final baseRepos = <DataSyncRepo>[
    GrocerySyncRepo(supabaseClient: supabaseClient, repo: groceryRepo),
    IngredientSyncRepo(repo: ingredientRepo, supabaseClient: supabaseClient),
    ShoppingSyncRepo(supabaseClient: supabaseClient, repo: shoppingRepo),
  ];

  final proRepos = <DataSyncRepo>[
    RecipeSyncRepo(supabaseClient: supabaseClient, repo: recipeRepo),
    RecipeStepSyncRepo(supabaseClient: supabaseClient, repo: recipeStepRepo),
    RecipeStepIngredientSyncRepo(
      supabaseClient: supabaseClient,
      repo: recipeStepIngredientRepo,
    ),
    TagSyncRepo(supabaseClient: supabaseClient, repo: tagRepo),
    RecipeTagSyncRepo(supabaseClient: supabaseClient, repo: recipeTagRepo),
    StorageSyncRepo(supabaseClient: supabaseClient, repo: storageRepo),
    RecipeStatisticSyncRepo(
      supabaseClient: supabaseClient,
      repo: recipeStatisticRepo,
    ),
    RecipeShoppingSyncRepo(
      supabaseClient: supabaseClient,
      repo: recipeShoppingRepo,
    ),
  ];

  return SyncOrchestrator(
    syncRepos: [...baseRepos, if (pro) ...proRepos],
    supabaseClient: supabaseClient,
  );
}
