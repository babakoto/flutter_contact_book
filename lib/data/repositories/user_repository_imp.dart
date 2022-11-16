import 'package:flutter_contact/core/errors/exceptions/network_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/server_exception.dart';
import 'package:flutter_contact/core/errors/failure/network_failure.dart';
import 'package:flutter_contact/core/errors/failure/server_failure.dart';
import 'package:flutter_contact/core/errors/failure/unknown_failure.dart';
import 'package:flutter_contact/core/utils/fos/failure.dart';
import 'package:flutter_contact/core/utils/fos/fos.dart';
import 'package:flutter_contact/data/services/users/user_service.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';
import 'package:flutter_contact/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserService userService;

  const UserRepositoryImp({
    required this.userService,
  });

  @override
  Future<Fos<Failure, List<UserEntity>>> findUsers() async {
    try {
      final users = await userService.findUsers();
      return SuccessResponse(users);
    } on NetworkException catch (e) {
      return FailureResponse(NetworkFailure(message: e.message));
    } on ServerException catch (e) {
      return FailureResponse(ServerFailure(message: e.message));
    } catch (e) {
      return FailureResponse(UnknownFailure(message: "$e"));
    }
  }
}
