import 'package:flutter_riverpod/experimental/mutation.dart';

extension RefExtension on MutationTarget {
  Future<T> run<T>(Future<T> Function(MutationTransaction tsx) cb) async {
    final mutation = Mutation();

    return (await mutation.run(this, cb)) as T;
  }
}
