import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/application_constants.dart';

part 'backend_config_data.freezed.dart';
part 'backend_config_data.g.dart';

@freezed
abstract class BackendConfigData with _$BackendConfigData {
  const BackendConfigData._();

  const factory BackendConfigData({required String url, required String key}) =
      _BackendConfigData;

  factory BackendConfigData.fromJson(Map<String, Object?> json) =>
      _$BackendConfigDataFromJson(json);

  bool get custom => _host(url) != _host(supabaseUrl);

  static String? _host(String url) => Uri.tryParse(url)?.host.toLowerCase();
}
