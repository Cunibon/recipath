import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/drift/database.dart';

part 'file_data.freezed.dart';

@freezed
abstract class FileData with _$FileData {
  const factory FileData({required String fileName, required bool uploaded}) =
      _FileData;

  factory FileData.fromTableData(FileTableData data) =>
      FileData(fileName: data.fileName, uploaded: data.uploaded);
}
