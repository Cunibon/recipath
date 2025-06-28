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
