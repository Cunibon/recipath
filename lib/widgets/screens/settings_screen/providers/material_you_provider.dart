import 'package:localstorage/localstorage.dart';
import 'package:recipe_list/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_you_provider.g.dart';

@riverpod
class MaterialYouProvider extends _$MaterialYouProvider {
  static const materialYouKey = "materialYouKey";

  @override
  bool build() => localStorage.getBool(materialYouKey) ?? false;

  void set(bool value) {
    localStorage.setDynamic(materialYouKey, value);

    ref.invalidateSelf();
  }
}
