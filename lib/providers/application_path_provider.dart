import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'application_path_provider.g.dart';

@riverpod
Future<Directory> applicationPath(Ref ref) => getApplicationSupportDirectory();
