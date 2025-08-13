import 'package:flutter/material.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/helper/date_time_extension.dart';
import 'package:recipe_list/widgets/navigation/navigation_drawer_scaffold.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/grocery_chart/grocery_chart.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/kcal_chart/nutrition_chart.dart';
import 'package:recipe_list/widgets/screens/dashboard_screen/charts/recipe_chart/recipe_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DateTimeRange dateRange;
  late Set<String> selectedRecipes = {};

  @override
  void initState() {
    super.initState();
    dateRange = DateTimeRange(
      start: DateTime.now().subtract(Duration(days: 7)),
      end: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationDrawerScaffold(
      titleBuilder: (title) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          Text(
            "${dateFormat.format(dateRange.start)} - ${dateFormat.format(dateRange.end)}",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newDateRange = await showDateRangePicker(
            context: context,
            initialDateRange: DateTimeRange(
              start: dateRange.start,
              end: dateRange.end.subtract(Duration(days: 1)),
            ),
            firstDate: DateTime.fromMillisecondsSinceEpoch(0),
            lastDate: DateTime.now().toDate().add(Duration(days: 1)),
          );
          if (newDateRange != null) {
            setState(() {
              dateRange = DateTimeRange(
                start: newDateRange.start,
                end: newDateRange.end.add(Duration(days: 1)),
              );
            });
          }
        },
        child: Icon(Icons.calendar_month),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 78),
        child: Column(
          children: [
            RecipeChart(
              dateRange: dateRange,
              selectedRecipes: selectedRecipes,
              onTap: (recipeId) => setState(() {
                if (recipeId != null) {
                  selectedRecipes = {...selectedRecipes, recipeId};
                } else {
                  selectedRecipes = {};
                }
              }),
            ),
            GroceryChart(
              dateRange: dateRange,
              selectedRecipes: selectedRecipes,
            ),
            NutritionChart(
              dateRange: dateRange,
              selectedRecipes: selectedRecipes,
            ),
          ],
        ),
      ),
    );
  }
}
