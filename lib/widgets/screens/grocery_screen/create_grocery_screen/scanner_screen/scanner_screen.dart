import 'dart:convert';

import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:recipath/data/gtin_data/gtin_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/information_dialog.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  late bool isLoading = false;
  late bool foundGTIN = false;

  bool isValidGTIN(String barcode) {
    final clean = barcode.trim();
    if (!RegExp(r'^\d+$').hasMatch(clean)) return false;

    final length = clean.length;
    if (!(length == 8 || length == 12 || length == 13 || length == 14)) {
      return false;
    }

    final digits = clean.split('').map(int.parse).toList();

    int sum = 0;
    for (int i = 0; i < length - 1; i++) {
      final value = digits[i];
      final multiplier = (length - i) % 2 == 0 ? 3 : 1;
      sum += value * multiplier;
    }

    final checkDigit = (10 - (sum % 10)) % 10;
    return checkDigit == digits.last;
  }

  Future<void> handleProductNotFound({
    required AppLocalizations localization,
    required String barcode,
    required GoRouter goRouter,
  }) async {
    final addManually = await showDialog<bool>(
      context: context,
      builder: (context) => TwoOptionDialog(
        title: localization.couldNotFindBarcode(barcode),
        content: Text(localization.addManuallyAndContribute),
        agree: localization.addManually,
        disagree: localization.no,
      ),
    );

    if (addManually == true && mounted) {
      foundGTIN = true;
      goRouter.pop(
        GTINData(barcode: barcode, name: '', amount: 100, unit: UnitEnum.g),
      );
    }
  }

  Future<void> showOpenFoodFactsError(AppLocalizations localization) async {
    await showDialog<void>(
      context: context,
      builder: (context) =>
          InformationDialog(message: localization.couldNotReachOpenFoodFacts),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.scanGrocery,
          style: TextTheme.of(context).titleLarge,
        ),
        actions: [
          TextButton(
            onPressed: () =>
                launchUrl(Uri.parse("https://world.openfoodfacts.org/")),
            child: Text("Product data provided\nby OpenFoodFacts.org"),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcodes) async {
              if (isLoading || foundGTIN) return;
              final barcode = barcodes.barcodes.first.rawValue;

              if (barcode == null || !isValidGTIN(barcode)) {
                return;
              }

              final url = Uri.parse(
                'https://world.openfoodfacts.org/api/v0/product/$barcode.json',
              );

              setState(() {
                isLoading = true;
              });

              final goRouter = GoRouter.of(context);

              try {
                final response = await http
                    .get(url)
                    .timeout(const Duration(seconds: 15));

                if (context.mounted) {
                  if (response.statusCode != 200) {
                    await showOpenFoodFactsError(localization);
                    return;
                  }

                  final data = jsonDecode(response.body);
                  if (data is! Map<String, dynamic>) {
                    await showOpenFoodFactsError(localization);
                    return;
                  }

                  if (data['status'] == 0 || data['product'] == null) {
                    await handleProductNotFound(
                      localization: localization,
                      barcode: barcode,
                      goRouter: goRouter,
                    );
                    return;
                  }

                  final gtin = GTINData.fromAPI(barcode, data);
                  if (gtin == null) {
                    await showOpenFoodFactsError(localization);
                    return;
                  }

                  foundGTIN = true;
                  goRouter.pop(gtin);
                }
              } catch (_) {
                if (context.mounted) {
                  await showOpenFoodFactsError(localization);
                }
              } finally {
                if (context.mounted) {
                  setState(() {
                    isLoading = false;
                  });
                }
              }
            },
          ),
          if (isLoading)
            ColoredBox(
              color: Colors.black87.withAlpha(128),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
