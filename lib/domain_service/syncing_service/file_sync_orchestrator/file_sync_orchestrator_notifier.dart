import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/domain_service/syncing_service/file_sync_orchestrator/bucket_repo.dart';
import 'package:recipath/domain_service/syncing_service/file_sync_orchestrator/file_sync_orchestrator.dart';
import 'package:recipath/domain_service/syncing_service/supabase_buckets.dart';
import 'package:recipath/providers/application_path_provider.dart';
import 'package:recipath/repos/file/file_repo_notifier.dart';
import 'package:recipath/widgets/providers/supabase/supabase_client_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'file_sync_orchestrator_notifier.g.dart';

@riverpod
FileSyncOrchestrator fileSyncOrchestratorNotifier(Ref ref) {
  final fileRepo = ref.watch(fileRepoNotifierProvider);

  final supabaseClient = ref.watch(supabaseClientProvider);
  final applicationPath = ref.watch(applicationPathProvider);

  return FileSyncOrchestrator(
    supabaseClient: supabaseClient,
    filePath: applicationPath.path,
    bucketRepos: [
      BucketRepo(
        bucket: SupabaseBuckets.recipeImage,
        contentType: "image/jpeg",
        repo: fileRepo,
      ),
    ],
  );
}
