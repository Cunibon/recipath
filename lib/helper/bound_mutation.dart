import 'package:flutter_riverpod/experimental/mutation.dart';

class BoundMutation<ResultT, InputR> {
  BoundMutation(this.cb, {Object? label})
    : _mutation = Mutation<ResultT>(label: label);

  final Mutation<ResultT> _mutation;
  Mutation<ResultT> get mutation => _mutation;

  final Future<ResultT> Function(MutationTransaction transaction, InputR input)
  cb;

  Future<ResultT> run(MutationTarget target, InputR input) =>
      _mutation.run(target, (transaction) => cb(transaction, input));
}
