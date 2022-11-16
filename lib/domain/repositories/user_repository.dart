import 'package:flutter_contact/core/utils/fos/failure.dart';
import 'package:flutter_contact/core/utils/fos/fos.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Fos<Failure, List<UserEntity>>> findUsers();
}
