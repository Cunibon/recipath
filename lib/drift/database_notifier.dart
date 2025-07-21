import 'package:recipe_list/drift/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_notifier.g.dart';

@Riverpod(keepAlive: true)
class DatabaseNotifier extends _$DatabaseNotifier {
  @override
  Future<AppDatabase> build() async {
    final isolateDb = await AppDatabase.createIsolate();
    return AppDatabase(await isolateDb.connect());
  }
}
