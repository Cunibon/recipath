import 'package:localstorage/localstorage.dart';
import 'package:recipath/helper/local_storage_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'storage_mode_provider.g.dart';

@riverpod
class StorageModeNotifier extends _$StorageModeNotifier {
  static const storageModeKey = "storageModeKey";

  @override
  bool build() {
    return localStorage.get<bool>(storageModeKey) ?? true;
  }

  void set(bool storageMode) {
    localStorage.set(storageModeKey, storageMode);
    ref.invalidateSelf();
  }
}
