class FullDownloadResult {
  FullDownloadResult({required this.lastSyncs, required this.count});

  final Map<String, DateTime> lastSyncs;
  final int count;
}
