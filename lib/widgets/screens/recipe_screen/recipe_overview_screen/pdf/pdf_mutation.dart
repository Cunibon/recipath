import 'dart:io';

import 'package:flutter/material.dart' as flutter;
import 'package:flutter_riverpod/experimental/mutation.dart';
import 'package:pdf/widgets.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/recipe_data/recipe_data.dart';
import 'package:recipath/providers/app_localizations_notifier.dart';
import 'package:recipath/widgets/providers/double_number_format_notifier.dart';
import 'package:recipath/widgets/screens/grocery_screen/providers/grocery_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/providers/local_file_notifier.dart';
import 'package:recipath/widgets/screens/recipe_screen/recipe_overview_screen/pdf/widgets/pdf_recipe_overview.dart';
import 'package:share_plus/share_plus.dart';

abstract class PdfMutation {
  static final mutation = Mutation();

  static Future<void> runPdfExport(
    MutationTarget ref,
    RecipeData recipe,
  ) async => mutation.run(ref, (tsx) async {
    final title = normalizeFileName(recipe.title);
    File? image;

    if (recipe.imageName != null) {
      image = tsx.get(localFileProvider(recipe.imageName!));
    }

    final localization = await tsx.get(appLocalizationsProvider.future);

    final groceriesAsync = await tsx.get(groceryProvider.future);
    final doubleNumberFormat = tsx.get(doubleNumberFormatProvider);

    final pdf = Document(title: title);

    pdf.addPage(
      MultiPage(
        maxPages: 100,
        build: (context) => [
          PdfRecipeOverview(
            recipe: recipe,
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
    final params = ShareParams(
      files: [xfile],
      fileNameOverrides: ["$title.pdf"],
    );

    await SharePlus.instance.share(params);
  });
}
