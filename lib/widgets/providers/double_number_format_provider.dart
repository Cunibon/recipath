import 'package:intl/intl.dart';
import 'package:recipath/widgets/providers/locale_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'double_number_format_provider.g.dart';

@riverpod
NumberFormat doubleNumberFormatNotifier(Ref ref) =>
    NumberFormat(null, ref.watch(localeProvider).languageCode)
      ..maximumFractionDigits = 2;
