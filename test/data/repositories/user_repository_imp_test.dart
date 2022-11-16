import 'package:flutter_contact/core/errors/exceptions/network_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/server_exception.dart';
import 'package:flutter_contact/core/errors/failure/network_failure.dart';
import 'package:flutter_contact/core/errors/failure/server_failure.dart';
import 'package:flutter_contact/core/utils/fos/fos.dart';
import 'package:flutter_contact/data/repositories/user_repository_imp.dart';
import 'package:flutter_contact/data/services/users/user_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../data_mocks.dart';

class MockUserService extends Mock implements UserService {}

main() {
  late MockUserService userService;
  late UserRepositoryImp userRepositoryImp;

  setUp(() {
    userService = MockUserService();
    userRepositoryImp = UserRepositoryImp(userService: userService);
  });

  group("FindUsers", () {
    test(
        "Should return SuccessResponse(List<UserEntity>) when request success ",
        () async {
      when(() => userService.findUsers()).thenAnswer((_) async => usersModel);
      final result = await userRepositoryImp.findUsers();
      expect(result, const SuccessResponse(usersModel));
    });

    test("Should return NetworkFailure() when throw NetworkException ",
        () async {
      when(() => userService.findUsers()).thenThrow(NetworkException());
      final result = await userRepositoryImp.findUsers();
      expect(
        result,
        const FailureResponse(
          NetworkFailure(message: "You are offline"),
        ),
      );
    });

    test("Should return ServerFailure() when throw serverException ", () async {
      when(() => userService.findUsers())
          .thenThrow(ServerException(message: "Server fail"));
      final result = await userRepositoryImp.findUsers();
      expect(
        result,
        const FailureResponse(
          ServerFailure(message: "Server fail"),
        ),
      );
    });
  });
}
