import 'package:flutter_contact/core/utils/fos/fos.dart';
import 'package:flutter_contact/domain/repositories/user_repository.dart';
import 'package:flutter_contact/domain/usecases/find_users_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../data_mocks.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;
  late FindUsersUseCase findUsersUseCase;

  setUp(() {
    userRepository = MockUserRepository();
    findUsersUseCase = FindUsersUseCase(userRepository: userRepository);
  });

  test("Should return List<Users> from repository", () async {
    when(() => userRepository.findUsers())
        .thenAnswer((_) async => const SuccessResponse(usersEntity));
    final result = await findUsersUseCase();
    expect(result, const SuccessResponse(usersEntity));
  });
}
