import 'package:recipath/domain_service/syncing_service/assemblers/grocery_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/ingredient_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/recipe_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/recipe_shopping_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/recipe_statistic_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/recipe_tag_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/shopping_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/storage_assembler.dart';
import 'package:recipath/domain_service/syncing_service/assemblers/tag_assembler.dart';
import 'package:recipath/domain_service/syncing_service/repos/abstract/data_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/download/ingredient_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/download/recipe_step_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/download/recipe_step_ingredient_download_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/grocery_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/recipe_shopping_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/recipe_statistic_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/recipe_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/recipe_tag_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/shopping_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/storage_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/repos/sync/tag_sync_repo.dart';
import 'package:recipath/domain_service/syncing_service/supabase_tables.dart';
import 'package:recipath/domain_service/syncing_service/sync_orchestrator/sync_orchestartor.dart';
import 'package:recipath/repos/grocery/full_grocery_repo_notifier.dart';
import 'package:recipath/repos/recipe/drift/full_recipe_repo_notifier.dart';
import 'package:recipath/repos/recipe_shopping/recipe_shopping_repo_notifier.dart';
import 'package:recipath/repos/recipe_statistics/recipe_statistics_repo_notifier.dart';
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
  final groceryRepo = ref.watch(fullGroceryRepoProvider);
  final recipeRepo = ref.watch(fullRecipeRepoProvider);
  final shoppingRepo = ref.watch(fullShoppingRepoProvider);
  final storageRepo = ref.watch(fullStorageRepoProvider);
  final tagRepo = ref.watch(fullTagRepoProvider);
  final recipeTagRepo = ref.watch(fullRecipeTagRepoProvider);
  final recipeStatisticRepo = ref.watch(recipeStatisticsRepoProvider);
  final recipeShoppingRepo = ref.watch(recipeShoppingRepoProvider);

  final supabaseClient = ref.watch(supabaseClientProvider);

  final pro = await ref.watch(revenueProProvider.future);

  final uploadOrder = [
    SupabaseTables.grocery,
    SupabaseTables.ingredient,
    SupabaseTables.shopping,

    if (pro == true) ...[
      SupabaseTables.recipe,
      SupabaseTables.recipeStep,
      SupabaseTables.recipeStepIngredient,

      SupabaseTables.tag,
      SupabaseTables.recipeTag,

      SupabaseTables.storage,

      SupabaseTables.recipeStatistic,
      SupabaseTables.recipeShopping,
    ],
  ];

  final baseRepos = <DataSyncRepo>[
    GrocerySyncRepo(supabaseClient: supabaseClient, repo: groceryRepo),
    ShoppingSyncRepo(supabaseClient: supabaseClient, repo: shoppingRepo),
  ];

  final proRepos = <DataSyncRepo>[
    RecipeSyncRepo(supabaseClient: supabaseClient, repo: recipeRepo),
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
    uploads: [...baseRepos, if (pro) ...proRepos],
    uploadOrder: uploadOrder,
    downloads: [
      IngredientDownloadRepo(supabaseClient: supabaseClient),
      RecipeStepDownloadRepo(supabaseClient: supabaseClient),
      RecipeStepIngredientDownloadRepo(supabaseClient: supabaseClient),
      ...baseRepos,
      ...proRepos,
    ],
    assemblers: [
      GroceryAssembler(repo: groceryRepo),
      IngredientAssembler(),
      RecipeAssembler(repo: recipeRepo),
      TagAssembler(repo: tagRepo),
      RecipeTagAssembler(repo: recipeTagRepo),
      ShoppingAssembler(repo: shoppingRepo),
      StorageAssembler(repo: storageRepo),
      RecipeStatisticAssembler(repo: recipeStatisticRepo),
      RecipeShoppingAssembler(repo: recipeShoppingRepo),
    ],
    supabaseClient: supabaseClient,
  );
}
