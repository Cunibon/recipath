import 'package:recipath/data/file_data/file_data.dart';
import 'package:recipath/repos/repo.dart';

class FileModifier {
  FileModifier(this.repo);
  final Repo<FileData> repo;

  Future<void> add(String fileName) =>
      repo.add(FileData(fileName: fileName, uploaded: false));
}
