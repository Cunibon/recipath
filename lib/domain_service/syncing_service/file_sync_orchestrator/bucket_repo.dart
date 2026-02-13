import 'package:recipath/data/file_data/file_data.dart';
import 'package:recipath/repos/abstract/local_repo.dart';

class BucketRepo {
  BucketRepo({
    required this.bucket,
    required this.contentType,
    required this.repo,
  });

  final String bucket;
  final String contentType;

  final LocalRepo<FileData> repo;
}
