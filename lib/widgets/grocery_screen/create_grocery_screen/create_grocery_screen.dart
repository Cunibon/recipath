import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_string/random_string.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/widgets/grocery_screen/providers/grocery_notifier.dart';

class CreateGroceryScreen extends ConsumerStatefulWidget {
  const CreateGroceryScreen({this.groceryId, super.key});

  final String? groceryId;

  @override
  ConsumerState<CreateGroceryScreen> createState() => _CreateGroceryScreen();
}

class _CreateGroceryScreen extends ConsumerState<CreateGroceryScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late GroceryData data;

  @override
  void initState() {
    super.initState();
    data =
        ref.read(groceryNotifierProvider)[widget.groceryId] ??
        GroceryData(
          id: randomAlphaNumeric(16),
          name: "",
          normalAmount: 0,
          unit: UnitEnum.g,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState?.validate() == true) {
            ref.read(groceryNotifierProvider.notifier).addGrocery(data);
          }
        },
        child: Icon(Icons.save),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
                initialValue: data.name,
                onChanged: (value) =>
                    setState(() => data = data.copyWith(name: value)),
              ),
              Row(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "Normal amount"),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    initialValue: data.normalAmount.toString(),
                    onChanged: (value) {
                      final parsed = double.tryParse(value);
                      if (parsed != null) {
                        setState(
                          () => data = data.copyWith(normalAmount: parsed),
                        );
                      }
                    },
                  ),
                  DropdownButtonFormField(
                    decoration: InputDecoration(labelText: "Unit"),
                    value: data.unit,
                    items: UnitEnum.values
                        .map(
                          (e) =>
                              DropdownMenuItem(value: e, child: Text(e.name)),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => data = data.copyWith(unit: value));
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
