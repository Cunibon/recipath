import 'package:http/http.dart' as http;
import 'package:recipath/domain_service/open_food_facts_service/open_food_facts_service.dart';
import 'package:recipath/widgets/screens/settings_screen/providers/package_info_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'open_food_facts_service_notifier.g.dart';

@riverpod
Future<OpenFoodFactsService> openFoodFactsService(Ref ref) async =>
    OpenFoodFactsService(
      client: http.Client(),
      appVersion: (await ref.read(packageInfoProvider.future)).version,
    );
