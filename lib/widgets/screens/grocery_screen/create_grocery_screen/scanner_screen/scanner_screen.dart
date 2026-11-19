import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:random_string/random_string.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/open_food_facts_account/open_food_facts_account_data.dart';
import 'package:recipath/domain_service/open_food_facts_service/open_food_facts_service_notifier.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/dialogs/two_option_dialog.dart';
import 'package:recipath/widgets/generic/information_dialog.dart';
import 'package:recipath/widgets/providers/open_food_facts/open_food_facts_account_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/create_grocery_screen/scanner_screen/dialogs/manual_food_facts_dialog.dart';
import 'package:recipath/widgets/screens/grocery_screen/create_grocery_screen/scanner_screen/open_food_facts_mutation.dart';
import 'package:recipath/widgets/screens/settings_screen/data/dialogs/open_food_facts_account_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannerScreen extends ConsumerStatefulWidget {
  const ScannerScreen({super.key});

  @override
  ConsumerState<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends ConsumerState<ScannerScreen> {
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

  Future<GroceryData?> checkAddManually(
    BuildContext context,
    String barcode,
  ) async {
    final localization = AppLocalizations.of(context)!;

    OpenFoodFactsAccountData? account = await ref.read(
      openFoodFactsAccountProvider.future,
    );

    if (account == null && context.mounted) {
      final addManually = await showDialog<bool>(
        context: context,
        builder: (context) => TwoOptionDialog(
          title: localization.couldNotFindBarcode(barcode),
          content: Text(localization.addManuallyAndContribute),
          agree: localization.addManually,
          disagree: localization.no,
        ),
      );

      if (addManually != true) {
        return null;
      }

      if (context.mounted) {
        account = await showDialog(
          context: context,
          builder: (context) =>
              OpenFoodFactsAccountDialog(accountData: account),
        );
      }
    }

    if (account == null || !context.mounted) {
      return null;
    }

    final data = await showDialog<GroceryData>(
      context: context,
      builder: (context) => ManualFoodFactsDialog(),
    );
    final grocery = data?.copyWith(barcode: barcode);

    if (grocery != null) {
      final foodFacts = await ref.read(openFoodFactsServiceProvider.future);
      foodFacts.uploadProduct(account: account, grocery: grocery);
    }

    return grocery;
  }

  Future<GroceryData?> lookupBarcode(
    BuildContext context,
    String barcode,
  ) async {
    final localization = AppLocalizations.of(context)!;

    Future<void> showMessage(String message) async {
      if (context.mounted) {
        await showDialog<void>(
          context: context,
          builder: (context) => InformationDialog(message: message),
        );
      }
    }

    try {
      final gtin = await openFoodFactsMutation.run(ref, barcode);

      if (gtin != null) {
        return GroceryData.fromGTIN(gtin, id: randomAlphaNumeric(16));
      }

      await showMessage(localization.couldNotParseOpenFoodFacts);
    } on OpenFoodFactsProductNotFoundException catch (_) {
      if (context.mounted) {
        return checkAddManually(context, barcode);
      }
    } on OpenFoodFactsDifferentProductTypeException catch (_) {
      await showMessage(localization.openFoodFactsNotFoodProduct);
    } catch (e) {
      await showMessage(localization.couldNotReachOpenFoodFacts);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    final state = ref.watch(openFoodFactsMutation);

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
            child: Text(localization.productDataProvidedByOpenFoodFacts),
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            onDetect: (barcodes) async {
              if (!ref.read(openFoodFactsMutation).isIdle) return;
              final barcode = barcodes.barcodes.first.rawValue;

              if (barcode == null || !isValidGTIN(barcode)) {
                return;
              }

              final grocery = await lookupBarcode(context, barcode);

              if (!context.mounted) return;

              if (grocery != null) {
                context.pop(grocery);
              } else {
                openFoodFactsMutation.reset(ref);
              }
            },
          ),
          if (state.isPending)
            ColoredBox(
              color: Colors.black87.withAlpha(128),
              child: Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
