class FullDownloadResult {
  FullDownloadResult({required this.tableSyncs, required this.count});

  final Map<String, DateTime> tableSyncs;
  final int count;
}
