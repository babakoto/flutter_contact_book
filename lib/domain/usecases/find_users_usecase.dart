import 'package:flutter_contact/core/generics/usecases.dart';
import 'package:flutter_contact/core/utils/fos/failure.dart';
import 'package:flutter_contact/core/utils/fos/fos.dart';
import 'package:flutter_contact/domain/entities/user_entity.dart';
import 'package:flutter_contact/domain/repositories/user_repository.dart';

class FindUsersUseCase extends UseCase<dynamic, List<UserEntity>> {
  final UserRepository userRepository;

  FindUsersUseCase({
    required this.userRepository,
  });

  @override
  Future<Fos<Failure, List<UserEntity>>> call({input}) {
    return userRepository.findUsers();
  }
}
