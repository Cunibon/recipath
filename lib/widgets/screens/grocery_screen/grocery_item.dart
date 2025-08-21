import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/common.dart';
import 'package:recipath/data/grocery_data/grocery_data.dart';
import 'package:recipath/data/unit_enum.dart';
import 'package:recipath/root_routes.dart';
import 'package:recipath/widgets/generic/highlight_search/highlightable_text.dart';
import 'package:recipath/widgets/screens/grocery_screen/grocery_routes.dart';

class GroceryItem extends StatelessWidget {
  const GroceryItem({required this.data, super.key});
  final GroceryData data;

  @override
  Widget build(BuildContext context) {
    final unitLocalized = localizeUnits(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                onPressed: () => context.go(
                  Uri(
                    path:
                        '${RootRoutes.groceriesRoute.path}/${GroceryRoutes.createGrocery.path}',
                    queryParameters: {idParameter: data.id},
                  ).toString(),
                ),
                icon: Icon(Icons.edit),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HighlightableText(
                  data.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                HighlightableText(
                  "${doubleNumberFormat.format(data.normalAmount)}${unitLocalized[data.unit]}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
