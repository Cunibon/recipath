import 'package:flutter/material.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data.dart';
import 'package:recipe_list/data/unit_enum.dart';

class GroceryFormFields extends StatelessWidget {
  const GroceryFormFields({
    required this.updateData,
    required this.nameController,
    required this.amountController,
    required this.conversionController,
    required this.kcalController,
    required this.data,
    super.key,
  });

  final void Function(GroceryData data) updateData;

  final TextEditingController nameController;
  final TextEditingController amountController;
  final TextEditingController conversionController;
  final TextEditingController kcalController;

  final GroceryData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: "Name"),
            validator: (value) =>
                value == null || value.isEmpty ? "Add name" : null,
            onChanged: (value) => updateData(data.copyWith(name: value)),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: TextFormField(
                  controller: amountController,
                  decoration: InputDecoration(labelText: "Normal amount"),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) =>
                      value == null ||
                          value.isEmpty ||
                          doubleNumberFormat.tryParse(value) == 0
                      ? "Add normal amount"
                      : null,
                  onChanged: (value) {
                    final parsed = doubleNumberFormat
                        .tryParse(value)
                        ?.toDouble();
                    if (parsed != null) {
                      double conversion =
                          data.conversionAmount / data.normalAmount * parsed;

                      if (conversion.isNaN || conversion.isInfinite) {
                        conversion = data.conversionAmount;
                      }

                      if (conversion == 0) {
                        conversion = parsed;
                      }

                      conversionController.text = doubleNumberFormat.format(
                        conversion,
                      );

                      updateData(
                        data.copyWith(
                          normalAmount: parsed,
                          conversionAmount: conversion,
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                width: 65,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Unit"),
                  value: data.unit,
                  validator: (value) => value == null ? "Add unit" : null,
                  items: UnitEnum.values
                      .map(
                        (e) => DropdownMenuItem(value: e, child: Text(e.name)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      final newAmount = UnitConversion.convert(
                        data.normalAmount,
                        data.unit,
                        value,
                      );
                      amountController.text = doubleNumberFormat.format(
                        newAmount,
                      );

                      final unitType = UnitConversion.unitType(value);
                      late UnitEnum conversion;

                      switch (unitType) {
                        case UnitType.volume:
                          conversion = UnitEnum.g;
                          break;
                        case UnitType.weight:
                          conversion = UnitEnum.ml;
                          break;
                        default:
                          conversion = value;
                      }

                      updateData(
                        data.copyWith(
                          unit: value,
                          normalAmount: newAmount,
                          conversionUnit: conversion,
                          conversionAmount: newAmount,
                        ),
                      );
                    }
                  },
                ),
              ),
              if (UnitConversion.unitType(data.unit) != UnitType.misc) ...[
                SizedBox(width: 8),
                Text("=", style: Theme.of(context).textTheme.titleLarge),
                SizedBox(width: 8),
                Flexible(
                  flex: 3,
                  child: TextFormField(
                    controller: conversionController,
                    decoration: InputDecoration(labelText: "Conversion amount"),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: (value) => value == null || value.isEmpty
                        ? "Add conversion"
                        : null,
                    onChanged: (value) {
                      final parsed = doubleNumberFormat.tryParse(value);
                      if (parsed != null) {
                        updateData(
                          data.copyWith(conversionAmount: parsed.toDouble()),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 65,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(labelText: "Unit"),
                    value: data.conversionUnit,
                    validator: (value) => value == null ? "Add unit" : null,
                    items:
                        (UnitConversion.unitType(data.unit) == UnitType.volume
                                ? UnitConversion.weightToGram.keys
                                : UnitConversion.volumeToMl.keys)
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.name),
                              ),
                            )
                            .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        final newAmount = UnitConversion.convert(
                          data.conversionAmount,
                          data.conversionUnit,
                          value,
                        );
                        conversionController.text = doubleNumberFormat.format(
                          newAmount,
                        );
                        updateData(
                          data.copyWith(
                            conversionUnit: value,
                            conversionAmount: newAmount,
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ],
          ),
          TextFormField(
            controller: kcalController,
            decoration: InputDecoration(labelText: "kcal/100g"),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            validator: (value) => value?.isEmpty == false
                ? doubleNumberFormat.tryParse(value!) == null
                      ? "Add kcal amount"
                      : null
                : null,
            onChanged: (value) {
              final parsed = doubleNumberFormat.tryParse(value)?.toDouble();
              if (parsed != null) {
                updateData(data.copyWith(kcal: parsed));
              }
            },
          ),
        ],
      ),
    );
  }
}
