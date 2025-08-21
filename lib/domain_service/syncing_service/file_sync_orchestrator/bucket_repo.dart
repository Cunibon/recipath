import 'package:recipath/repos/sync_repo.dart';

class BucketRepo {
  BucketRepo({
    required this.bucket,
    required this.contentType,
    required this.repo,
  });

  final String bucket;
  final String contentType;

  final SyncRepo repo;
}
