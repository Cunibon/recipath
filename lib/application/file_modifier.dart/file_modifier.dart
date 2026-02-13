import 'package:recipath/data/file_data/file_data.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class FileModifier {
  FileModifier(this.repo);
  final LocalRepo<FileData> repo;

  Future<void> add(String fileName) =>
      repo.add(FileData(fileName: fileName, uploaded: false));
}
