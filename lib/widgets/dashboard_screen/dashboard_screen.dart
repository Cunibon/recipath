import 'package:flutter/material.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/helper/date_time_extension.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/grocery_chart.dart';
import 'package:recipe_list/widgets/dashboard_screen/charts/recipe_chart.dart';
import 'package:recipe_list/widgets/generic/navigation_drawer_scaffold.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DateTimeRange dateRange;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Recipe usage from ${dateFormat.format(dateRange.start)} - ${dateFormat.format(dateRange.end)}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Divider(),
            RecipeChart(dateRange: dateRange),
            Text(
              "Grocery usage from ${dateFormat.format(dateRange.start)} - ${dateFormat.format(dateRange.end)}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Divider(),
            GroceryChart(dateRange: dateRange),
          ],
        ),
      ),
    );
  }
}
