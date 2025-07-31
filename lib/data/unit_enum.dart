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

  //Miscellaneous
  @JsonValue("Pinch")
  pinch,
  @JsonValue("Clove")
  clove,
  @JsonValue("Can")
  can,
  @JsonValue("Piece")
  piece,
}

enum UnitType { volume, weight, misc }

class UnitConversion {
  static final Map<UnitEnum, double> volumeToMl = {
    UnitEnum.ml: 1.0,
    UnitEnum.l: 1000.0,
    UnitEnum.tsp: 5.0,
    UnitEnum.tbsp: 15.0,
    UnitEnum.cup: 240.0,
  };

  static final Map<UnitEnum, double> weightToGram = {
    UnitEnum.g: 1.0,
    UnitEnum.kg: 1000.0,
    UnitEnum.oz: 28.3495,
    UnitEnum.lb: 453.592,
  };

  static UnitType unitType(UnitEnum value) {
    if (volumeToMl.keys.contains(value)) {
      return UnitType.volume;
    } else if (weightToGram.keys.contains(value)) {
      return UnitType.weight;
    } else {
      return UnitType.misc;
    }
  }

  static double convert(double value, UnitEnum from, UnitEnum to) {
    final fromType = unitType(from);
    final toType = unitType(to);
    if (fromType != toType ||
        fromType == UnitType.misc && toType == UnitType.misc) {
      return value;
    }
    if (fromType == UnitType.volume) {
      return _convertVolume(value, from, to);
    } else {
      return _convertWeight(value, from, to);
    }
  }

  static double _convertVolume(double value, UnitEnum from, UnitEnum to) {
    double inMl = value * volumeToMl[from]!;
    return inMl / volumeToMl[to]!;
  }

  static double _convertWeight(double value, UnitEnum from, UnitEnum to) {
    double inGrams = value * weightToGram[from]!;
    return inGrams / weightToGram[to]!;
  }
}
