import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipath/drift/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'database_notifier.g.dart';

@Riverpod(keepAlive: true)
AppDatabase databaseNotifier(Ref ref) => throw UnimplementedError();
