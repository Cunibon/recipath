import 'package:flutter/material.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/data/tag_data/tag_data.dart';
import 'package:recipath/helper/go_router_extension.dart';
import 'package:recipath/widgets/screens/tag_screen/tag_routes.dart';
import 'package:recipath/widgets/tag/tag.dart';

class TagItem extends StatelessWidget {
  const TagItem({required this.data, super.key});
  final TagData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Tag(text: data.name, color: data.color),
            VerticalDivider(),
            Expanded(child: Text(data.description)),
            IconButton(
              onPressed: () => context.goRelative(
                TagRoutes.createTag.path,
                queryParameters: {idParameter: data.id},
              ),
              icon: Icon(Icons.edit),
            ),
          ],
        ),
      ),
    );
  }
}
