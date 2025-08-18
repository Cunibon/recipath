import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:recipe_list/data/gtin_data/gtin_data.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/generic/information_dialog.dart';
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

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localization.scanGrocery,
          style: Theme.of(context).textTheme.titleLarge,
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
                final response = await http.get(url);

                if (context.mounted) {
                  if (response.statusCode == 200) {
                    final data = jsonDecode(response.body);

                    final gtin = GTINData.fromAPI(data);
                    if (gtin != null) {
                      goRouter.pop(gtin);
                      foundGTIN = true;
                    } else {
                      await showDialog(
                        context: context,
                        builder: (context) => InformationDialog(
                          message: localization.couldNotFindBarcode,
                        ),
                      );
                    }
                  }
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
