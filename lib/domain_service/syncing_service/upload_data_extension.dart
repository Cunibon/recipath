import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/domain_service/syncing_service/syncing_service.dart';

extension UploadDataExtension on SyncingService {
  Future<void> upload() async {
    final groceryData = await groceryRepo.getNotUploaded();
    await supabaseClient
        .from('grocery')
        .upsert(groceryData.values.map((e) => e.toSupabase()));

    final recipeData = await recipeRepo.getNotUploaded();
    await supabaseClient
        .from('grocery')
        .upsert(recipeData.values.map((e) => e.toSupabase()));

    final shoppingData = await shoppingRepo.getNotUploaded();
    await supabaseClient
        .from('grocery')
        .upsert(shoppingData.values.map((e) => e.toSupabase()));

    final storageData = await storageRepo.getNotUploaded();
    await supabaseClient
        .from('grocery')
        .upsert(storageData.values.map((e) => e.toSupabase()));
  }
}
