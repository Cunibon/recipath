import 'package:recipath/domain_service/syncing_service/repos/sync_repos/grocery_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/grocery_tag_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/ingredient_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync_repos/quick_shopping_sync_repo.dart';
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
import 'package:recipath/repos/grocery_tag/full_grocery_tag_repo_notifier.dart';
import 'package:recipath/repos/ingredient_repo/ingredient_repo_notifier.dart';
import 'package:recipath/repos/quick_shopping/full_quick_shopping_repo_notifier.dart';
import 'package:recipath/repos/recipe/full_recipe_repo_notifier.dart';
import 'package:recipath/repos/recipe_shopping/recipe_shopping_repo_notifier.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:recipath/repos/recipe_step_ingredient_repo/recipe_step_ingredient_repo_notifier.dart';
import 'package:recipath/repos/recipe_step_repo/recipe_step_repo_notifier.dart';
import 'package:recipath/repos/recipe_tag/full_recipe_tag_repo_notifier.dart';
import 'package:recipath/repos/shopping/full_shopping_repo_notifier.dart';
import 'package:recipath/repos/storage/full_storage_repo_notifier.dart';
import 'package:recipath/repos/tag/full_tag_repo_notifier.dart';
import 'package:recipath/domain_service/backend/auth_service/auth_service_notifier.dart';
import 'package:recipath/domain_service/backend/remote_store/remote_store_notifier.dart';
import 'package:recipath/widgets/providers/subscription/pro_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_orchestrator_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<SyncOrchestrator> syncOrchestratorNotifier(Ref ref) async {
  final pro = await ref.watch(proProvider.future);
  final remoteStore = await ref.watch(remoteStoreProvider.future);
  final authService = await ref.watch(authServiceProvider.future);

  final groceryRepo = ref.watch(fullGroceryRepoProvider);
  final ingredientRepo = ref.watch(ingredientRepoProvider);
  final shoppingRepo = ref.watch(fullShoppingRepoProvider);
  final quickShoppingRepo = ref.watch(fullQuickShoppingRepoProvider);

  final recipeRepo = ref.watch(fullRecipeRepoProvider);
  final recipeStepRepo = ref.watch(recipeStepRepoProvider);
  final recipeStepIngredientRepo = ref.watch(recipeStepIngredientProvider);

  final tagRepo = ref.watch(fullTagRepoProvider);
  final recipeTagRepo = ref.watch(fullRecipeTagRepoProvider);
  final groceryTagRepo = ref.watch(fullGroceryTagRepoProvider);

  final storageRepo = ref.watch(fullStorageRepoProvider);

  final recipeStatisticRepo = ref.watch(recipeStatisticsRepoProvider);
  final recipeShoppingRepo = ref.watch(recipeShoppingRepoProvider);

  final syncRepoBatches = [
    [
      GrocerySyncRepo(remoteStore: remoteStore, repo: groceryRepo),
      if (pro) ...[
        RecipeSyncRepo(remoteStore: remoteStore, repo: recipeRepo),
        TagSyncRepo(remoteStore: remoteStore, repo: tagRepo),
      ],
    ],
    [
      IngredientSyncRepo(repo: ingredientRepo, remoteStore: remoteStore),
      if (pro) ...[
        RecipeStepSyncRepo(remoteStore: remoteStore, repo: recipeStepRepo),
        RecipeTagSyncRepo(remoteStore: remoteStore, repo: recipeTagRepo),
        GroceryTagSyncRepo(remoteStore: remoteStore, repo: groceryTagRepo),
        RecipeStatisticSyncRepo(
          remoteStore: remoteStore,
          repo: recipeStatisticRepo,
        ),
        RecipeShoppingSyncRepo(
          remoteStore: remoteStore,
          repo: recipeShoppingRepo,
        ),
      ],
    ],
    [
      ShoppingSyncRepo(remoteStore: remoteStore, repo: shoppingRepo),
      QuickShoppingSyncRepo(remoteStore: remoteStore, repo: quickShoppingRepo),
      if (pro) ...[
        RecipeStepIngredientSyncRepo(
          remoteStore: remoteStore,
          repo: recipeStepIngredientRepo,
        ),
        StorageSyncRepo(remoteStore: remoteStore, repo: storageRepo),
      ],
    ],
  ];

  return SyncOrchestrator(
    syncRepoBatches: syncRepoBatches,
    authService: authService,
  );
}
