import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/grocery_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/ingredient_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/recipe_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/recipe_shopping_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/recipe_statistic_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/shopping_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/storage_assembler.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/download/ingredient_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/download/recipe_step_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/download/recipe_step_ingredient_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/grocery_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/recipe_shopping_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/recipe_statistic_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/recipe_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/shopping_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/storage_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/upload_order_notifier.dart';
import 'package:recipath/repos/grocery/full_grocery_repo_notifier.dart';
import 'package:recipath/repos/recipe/full_recipe_repo_notifier.dart';
import 'package:recipath/repos/recipe_shopping/recipe_shopping_repo_notifier.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
import 'package:recipath/repos/shopping/full_shopping_repo_notifier.dart';
import 'package:recipath/repos/storage/full_storage_repo_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_orchestrator_notifier.g.dart';

@riverpod
Future<SyncOrchestrator> syncOrchestratorNotifier(Ref ref) async {
  final groceryRepo = ref.watch(fullGroceryRepoNotifierProvider);
  final recipeRepo = ref.watch(fullRecipeRepoNotifierProvider);
  final shoppingRepo = ref.watch(fullShoppingRepoNotifierProvider);
  final storageRepo = ref.watch(fullStorageRepoNotifierProvider);
  final recipeStatisticRepo = ref.watch(recipeStatisticsRepoNotifierProvider);
  final recipeShoppingRepo = ref.watch(recipeShoppingRepoNotifierProvider);

  final supabaseClient = ref.watch(supabaseClientProvider);

  final uploadOrder = await ref.watch(uploadOrderNotifierProvider.future);

  final syncRepos = <DataSyncRepo>[
    GrocerySyncRepo(supabaseClient: supabaseClient, repo: groceryRepo),
    RecipeSyncRepo(supabaseClient: supabaseClient, repo: recipeRepo),
    ShoppingSyncRepo(supabaseClient: supabaseClient, repo: shoppingRepo),
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
    uploads: syncRepos,
    uploadOrder: uploadOrder,
    downloads: [
      IngredientDownloadRepo(supabaseClient: supabaseClient),
      RecipeStepDownloadRepo(supabaseClient: supabaseClient),
      RecipeStepIngredientDownloadRepo(supabaseClient: supabaseClient),
      ...syncRepos,
    ],
    assemblers: [
      GroceryAssembler(repo: groceryRepo),
      IngredientAssembler(),
      RecipeAssembler(repo: recipeRepo),
      ShoppingAssembler(repo: shoppingRepo),
      StorageAssembler(repo: storageRepo),
      RecipeStatisticAssembler(repo: recipeStatisticRepo),
      RecipeShoppingAssembler(repo: recipeShoppingRepo),
    ],
    supabaseClient: supabaseClient,
  );
}
