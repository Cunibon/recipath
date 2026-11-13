import 'package:recipath/data/tag_data/tag_type_enum.dart';

enum FilterTypeEnum {
  recipe(tagType: TagTypeEnum.recipe),
  shopping(tagType: TagTypeEnum.grocery),
  storage(tagType: TagTypeEnum.grocery),
  grocery(tagType: TagTypeEnum.grocery);

  const FilterTypeEnum({required this.tagType});
  final TagTypeEnum tagType;
}
