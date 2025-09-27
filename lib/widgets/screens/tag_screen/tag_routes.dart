import 'package:go_router/go_router.dart';
import 'package:recipath/application_constants.dart';
import 'package:recipath/widgets/screens/tag_screen/create_tag_screen/create_tag_screen.dart';

abstract class TagRoutes {
  static GoRoute createTag = GoRoute(
    path: "createTag",
    builder: (context, state) =>
        CreateTagScreen(tagId: state.uri.queryParameters[idParameter]),
  );
}
