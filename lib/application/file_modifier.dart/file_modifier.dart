import 'package:recipe_list/drift/database.dart';
import 'package:recipe_list/repos/repo.dart';

class FileModifier {
  FileModifier(this.repo);
  final Repo<FileTableData> repo;

  Future<void> add(String fileName) =>
      repo.add(FileTableData(fileName: fileName, uploaded: false));
}
