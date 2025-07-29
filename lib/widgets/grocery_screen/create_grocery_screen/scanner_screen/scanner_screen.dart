import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:recipe_list/data/gtin_data.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  late bool isLoading = false;
  late bool foundGTIN = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan grocery",
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

              final url = Uri.parse(
                'https://world.openfoodfacts.org/api/v0/product/$barcode.json',
              );

              setState(() {
                isLoading = true;
              });

              final goRouter = GoRouter.of(context);

              try {
                final response = await http.get(url);

                if (mounted) {
                  if (response.statusCode == 200) {
                    final data = jsonDecode(response.body);

                    final gtin = GTINData.fromAPI(data);
                    if (gtin != null) {
                      goRouter.pop(gtin);
                      foundGTIN = true;
                    }
                  }
                }
              } finally {
                if (mounted) {
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
