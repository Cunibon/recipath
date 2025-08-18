import 'package:recipath/drift/database.dart';
import 'package:recipath/repos/repo.dart';

class FileModifier {
  FileModifier(this.repo);
  final Repo<FileTableData> repo;

  Future<void> add(String fileName) =>
      repo.add(FileTableData(fileName: fileName, uploaded: false));
}
