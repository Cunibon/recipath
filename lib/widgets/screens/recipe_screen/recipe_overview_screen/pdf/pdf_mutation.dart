import 'dart:io';

import 'package:bound_mutation/bound_mutation.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/gen/assets.gen.dart';
import 'package:recipath/providers/app_localizations_notifier.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/local_file_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_recipe_overview.dart';
import 'package:share_plus/share_plus.dart';

final pdfMutation = BoundMutation<void, RecipeData>((transaction, input) async {
  final title = normalizeFileName(input.title);
  File? image;

  if (input.imageName != null) {
    image = transaction.get(localFileProvider(input.imageName!));
  }

  final localization = await transaction.get(appLocalizationsProvider.future);

  final groceriesAsync = await transaction.get(groceryProvider.future);
  final doubleNumberFormat = transaction.get(doubleNumberFormatProvider);

  final regular = Font.ttf(await rootBundle.load(Assets.fonts.robotoRegular));
  final bold = Font.ttf(await rootBundle.load(Assets.fonts.robotoBold));

  final pdf = Document(
    title: title,
    theme: ThemeData.withFont(base: regular, bold: bold),
  );

  pdf.addPage(
    MultiPage(
      maxPages: 100,
      build: (context) => [
        PdfRecipeOverview(
          recipe: input,
          image: image,
          groceries: groceriesAsync,
          localization: localization,
          doubleNumberFormat: doubleNumberFormat,
          theme: flutter.ThemeData.light(),
        ),
      ],
    ),
  );

  final xfile = XFile.fromData(await pdf.save(), mimeType: "application/pdf");
  final params = ShareParams(files: [xfile], fileNameOverrides: ["$title.pdf"]);

  await SharePlus.instance.share(params);
});
