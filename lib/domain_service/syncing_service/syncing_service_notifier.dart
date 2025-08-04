import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service.dart';
import 'package:recipe_list/repos/grocery/grocery_repo_notifier.dart';
import 'package:recipe_list/repos/recipe/recipe_repo_notifier.dart';
import 'package:recipe_list/repos/shopping/shopping_repo_notifier.dart';
import 'package:recipe_list/repos/storage/storage_repo_notifier.dart';
import 'package:recipe_list/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'syncing_service_notifier.g.dart';

@Riverpod(keepAlive: true)
SyncingService syncingServiceNotifier(Ref ref) {
  final groceryRepo = ref.watch(groceryRepoNotifierProvider);
  final recipeRepo = ref.watch(recipeRepoNotifierProvider);
  final shoppingRepo = ref.watch(shoppingRepoNotifierProvider);
  final storageRepo = ref.watch(storageRepoNotifierProvider);

  final supabaseClient = ref.watch(supabaseClientProvider);

  final service = SyncingService(
    groceryRepo: groceryRepo,
    recipeRepo: recipeRepo,
    shoppingRepo: shoppingRepo,
    storageRepo: storageRepo,

    supabaseClient: supabaseClient,
  );

  ref.onDispose(() => service.stop());

  return service;
}
