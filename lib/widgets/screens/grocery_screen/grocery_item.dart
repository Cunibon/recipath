import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_list/application_constants.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/root_routes.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/grocery_routes.dart';

class GroceryItem extends StatelessWidget {
  const GroceryItem({required this.data, super.key});
  final GroceryData data;

  @override
  Widget build(BuildContext context) {
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
                Text(data.name, style: Theme.of(context).textTheme.titleMedium),
                Text(
                  "${doubleNumberFormat.format(data.normalAmount)}${data.unit.name}",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
