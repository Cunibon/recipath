import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum UnitEnum {
  // Volume
  @JsonValue("Milliliter")
  ml,
  @JsonValue("Liter")
  l,
  @JsonValue("Teaspoon")
  tsp,
  @JsonValue("Tablespoon")
  tbsp,
  @JsonValue("Cup")
  cup,

  // Weight
  @JsonValue("Gram")
  g,
  @JsonValue("Kilogram")
  kg,
  @JsonValue("Ounce")
  oz,
  @JsonValue("Pound")
  lb,
}

class UnitConversion {
  static final Map<UnitEnum, double> _volumeToMl = {
    UnitEnum.ml: 1.0,
    UnitEnum.l: 1000.0,
    UnitEnum.tsp: 5.0,
    UnitEnum.tbsp: 15.0,
    UnitEnum.cup: 240.0,
  };

  static final Map<UnitEnum, double> _weightToGram = {
    UnitEnum.g: 1.0,
    UnitEnum.kg: 1000.0,
    UnitEnum.oz: 28.3495,
    UnitEnum.lb: 453.592,
  };

  static double convertVolume(double value, UnitEnum from, UnitEnum to) {
    if (!_volumeToMl.containsKey(from) || !_volumeToMl.containsKey(to)) {
      throw ArgumentError("Invalid volume units");
    }
    double inMl = value * _volumeToMl[from]!;
    return inMl / _volumeToMl[to]!;
  }

  static double convertWeight(double value, UnitEnum from, UnitEnum to) {
    if (!_weightToGram.containsKey(from) || !_weightToGram.containsKey(to)) {
      throw ArgumentError("Invalid weight units");
    }
    double inGrams = value * _weightToGram[from]!;
    return inGrams / _weightToGram[to]!;
  }
}
