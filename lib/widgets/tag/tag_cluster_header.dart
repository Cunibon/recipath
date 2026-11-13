import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/widgets/filtering/filter_type_enum.dart';
import 'package:recipath/widgets/filtering/tag_filter_notifier.dart';
import 'package:recipath/widgets/generic/cached_async_value_wrapper.dart';
import 'package:recipath/widgets/screens/tag_screen/providers/tag_notifier.dart';
import 'package:recipath/widgets/tag/tag.dart';

class TagClusterHeader extends ConsumerWidget {
  const TagClusterHeader({
    required this.tagId,
    required this.filterType,
    super.key,
  });

  final String? tagId;
  final FilterTypeEnum filterType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: ColorScheme.of(context).surface,
      child: CachedAsyncValueWrapper(
        asyncState: ref.watch(tagProvider),
        builder: (data) {
          final tag = data[tagId ?? ""];
          if (tag != null) {
            return Column(
              crossAxisAlignment: .start,
              children: [
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () => ref
                      .read(tagFilterProvider(filterType).notifier)
                      .toggleFilter(filter: tag),
                  child: Tag(text: tag.name, color: tag.color),
                ),
                Divider(),
              ],
            );
          } else {
            return Divider();
          }
        },
      ),
    );
  }
}
