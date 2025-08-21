import 'package:localstorage/localstorage.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'material_you_provider.g.dart';

@riverpod
class MaterialYouNotifier extends _$MaterialYouNotifier {
  static const materialYouKey = "materialYouKey";

  @override
  bool build() => localStorage.getBool(materialYouKey) ?? false;

  void set(bool value) {
    localStorage.setDynamic(materialYouKey, value);

    ref.invalidateSelf();
  }
}
