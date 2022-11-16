import 'package:dio/dio.dart';
import 'package:flutter_contact/core/errors/exceptions/network_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/server_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/unauthorized_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/unknown_exception.dart';
import 'package:flutter_contact/data/models/user_model.dart';
import 'package:flutter_contact/data/services/networks/network_service.dart';
import 'package:flutter_contact/data/services/users/user_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../data_mocks.dart';

class MockNetworkService extends Mock implements NetworkService {}

class MockDioAdapter extends Mock implements DioAdapter {}

void main() {
  late Dio dio;
  late MockDioAdapter dioAdapter;
  late MockNetworkService networkService;
  late UserServiceImp userServiceImp;

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: ""));
  });

  setUp(() {
    dio = Dio();
    dioAdapter = MockDioAdapter();
    networkService = MockNetworkService();
    dio.httpClientAdapter = dioAdapter;

    userServiceImp = UserServiceImp(
      client: dio,
      networkService: networkService,
    );
  });

  group("findUsers", () {
    group("When app online", () {
      setUp(() {
        when(() => networkService.hasConnexion).thenAnswer((_) async => true);
      });
      test("Should return type List<UserModel> when status 201", () async {
        final responseBody = ResponseBody.fromString(
          usersString,
          201,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
        when(() => dioAdapter.fetch(any(), any(), any()))
            .thenAnswer((_) async => responseBody);
        final result = await userServiceImp.findUsers();
        expect(
          result.runtimeType,
          List<UserModel>,
        );
      });
      test("Should throw ServerException when status 500", () async {
        final responseBody = ResponseBody.fromString(
          errorMessage,
          500,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
        when(() => dioAdapter.fetch(any(), any(), any()))
            .thenAnswer((_) async => responseBody);
        final result = userServiceImp.findUsers;
        expect(() => result(), throwsA(const TypeMatcher<ServerException>()));
      });
      test("Should throw UnauthorizedException when status 403", () async {
        final responseBody = ResponseBody.fromString(
          errorMessage,
          403,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
        when(() => dioAdapter.fetch(any(), any(), any()))
            .thenAnswer((_) async => responseBody);
        final result = userServiceImp.findUsers;
        expect(() => result(),
            throwsA(const TypeMatcher<UnauthorizedException>()));
      });
      test("Should throw UnauthorizedException when status 401", () async {
        final responseBody = ResponseBody.fromString(
          errorMessage,
          401,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
        when(() => dioAdapter.fetch(any(), any(), any()))
            .thenAnswer((_) async => responseBody);
        final result = userServiceImp.findUsers;
        expect(() => result(),
            throwsA(const TypeMatcher<UnauthorizedException>()));
      });
      test("Should throw UnknownException when Error unknown", () async {
        when(() => dioAdapter.fetch(any(), any(), any()))
            .thenThrow(Exception("unknown error"));
        final result = userServiceImp.findUsers;
        expect(() => result(), throwsA(const TypeMatcher<UnknownException>()));
      });
    });

    group("When app offline", () {
      setUp(() {
        when(() => networkService.hasConnexion).thenAnswer((_) async => false);
      });
      test("Should throw NetworkException when not connected", () async {
        final responseBody = ResponseBody.fromString(
          errorMessage,
          500,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );
        when(() => dioAdapter.fetch(any(), any(), any()))
            .thenAnswer((_) async => responseBody);
        final result = userServiceImp.findUsers();
        expect(result, throwsA(const TypeMatcher<NetworkException>()));
      });
    });
  });
}
