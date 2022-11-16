import 'package:flutter_contact/core/utils/fos/failure.dart';

class NetworkFailure extends Failure {
  const NetworkFailure({super.message});

  @override
  List<Object?> get props => [message];
}
