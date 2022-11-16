import 'package:flutter_contact/core/utils/fos/failure.dart';
import 'package:flutter_contact/core/utils/fos/fos.dart';

/// [I] input data
/// [O] output data
abstract class UseCase<I, O> {
  Future<Fos<Failure, O>> call({I? input});
}
