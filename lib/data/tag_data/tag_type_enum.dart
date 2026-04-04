import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:recipath/l10n/app_localizations.dart';

@JsonEnum()
enum TagTypeEnum {
  @JsonValue("Recipe")
  recipe,
  @JsonValue("Grocery")
  grocery,
}

Map<TagTypeEnum, String> localizeTagType(AppLocalizations localization) => {
  TagTypeEnum.recipe: localization.recipe,
  TagTypeEnum.grocery: localization.grocery,
};
