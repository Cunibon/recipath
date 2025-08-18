import 'package:flutter/material.dart';
import 'package:recipe_list/common.dart';
import 'package:recipe_list/data/grocery_data/grocery_data.dart';
import 'package:recipe_list/data/unit_enum.dart';
import 'package:recipe_list/l10n/app_localizations.dart';
import 'package:recipe_list/widgets/screens/grocery_screen/create_grocery_screen/double_input_field.dart';

class GroceryFormFields extends StatelessWidget {
  const GroceryFormFields({
    required this.updateData,
    required this.nameController,
    required this.amountController,
    required this.conversionController,
    required this.kcalController,
    required this.fatController,
    required this.carbsController,
    required this.proteinController,
    required this.fiberController,
    required this.data,
    super.key,
  });

  final void Function(GroceryData data) updateData;

  final TextEditingController nameController;
  final TextEditingController amountController;
  final TextEditingController conversionController;
  final TextEditingController kcalController;
  final TextEditingController fatController;
  final TextEditingController carbsController;
  final TextEditingController proteinController;
  final TextEditingController fiberController;

  final GroceryData data;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final unitType = UnitConversion.unitType(data.unit);

    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(labelText: localization.name),
            validator: (value) =>
                value == null || value.isEmpty ? localization.addName : null,
            onChanged: (value) => updateData(data.copyWith(name: value)),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: TextFormField(
                  controller: amountController,
                  decoration: InputDecoration(
                    labelText: localization.normalAmount,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) =>
                      value == null ||
                          value.isEmpty ||
                          doubleNumberFormat.tryParse(value) == 0
                      ? localization.addNormalAmount
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
                  decoration: InputDecoration(labelText: localization.unit),
                  value: data.unit,
                  validator: (value) =>
                      value == null ? localization.addUnit : null,
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
              SizedBox(width: 8),
              Text("=", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(width: 8),
              Flexible(
                flex: 3,
                child: TextFormField(
                  controller: conversionController,
                  decoration: InputDecoration(
                    labelText: localization.conversionAmount,
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) => value == null || value.isEmpty
                      ? localization.addConversionAmount
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
                child: unitType == UnitType.misc
                    ? Text(
                        "g",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : DropdownButtonFormField(
                        decoration: InputDecoration(
                          labelText: localization.unit,
                        ),
                        value: data.conversionUnit,
                        validator: (value) =>
                            value == null ? localization.addUnit : null,
                        items:
                            (switch (unitType) {
                                  UnitType.volume =>
                                    UnitConversion.weightToGram.keys,
                                  UnitType.weight =>
                                    UnitConversion.volumeToMl.keys,
                                  UnitType.misc => [UnitEnum.g],
                                })
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
                            conversionController.text = doubleNumberFormat
                                .format(newAmount);
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
          ),
          DoubleInputField(
            controller: kcalController,
            labelText: "kcal/100g",
            validatorText: localization.addRealNumber,
            onChanged: (parsed) {
              if (parsed != null) {
                updateData(data.copyWith(kcal: parsed));
              }
            },
          ),
          DoubleInputField(
            controller: fatController,
            labelText: "fat/100g",
            validatorText: localization.addRealNumber,
            onChanged: (parsed) {
              if (parsed != null) {
                updateData(data.copyWith(fat: parsed));
              }
            },
          ),
          DoubleInputField(
            controller: carbsController,
            labelText: "carbs/100g",
            validatorText: localization.addRealNumber,
            onChanged: (parsed) {
              if (parsed != null) {
                updateData(data.copyWith(carbs: parsed));
              }
            },
          ),
          DoubleInputField(
            controller: proteinController,
            labelText: "protein/100g",
            validatorText: localization.addRealNumber,
            onChanged: (parsed) {
              if (parsed != null) {
                updateData(data.copyWith(protein: parsed));
              }
            },
          ),
          DoubleInputField(
            controller: fiberController,
            labelText: "fiber/100g",
            validatorText: localization.addRealNumber,
            onChanged: (parsed) {
              if (parsed != null) {
                updateData(data.copyWith(fiber: parsed));
              }
            },
          ),
        ],
      ),
    );
  }
}
