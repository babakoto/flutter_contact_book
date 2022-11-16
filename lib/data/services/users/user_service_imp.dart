import 'package:dio/dio.dart';
import 'package:flutter_contact/core/constants/network_path.dart';
import 'package:flutter_contact/core/errors/exceptions/network_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/server_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/storage_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/unauthorized_exception.dart';
import 'package:flutter_contact/core/errors/exceptions/unknown_exception.dart';
import 'package:flutter_contact/data/models/user_model.dart';
import 'package:flutter_contact/data/services/networks/network_service.dart';
import 'package:flutter_contact/data/services/users/user_service.dart';

class UserServiceImp implements UserService {
  final Dio client;
  final NetworkService networkService;

  const UserServiceImp({
    required this.client,
    required this.networkService,
  });

  @override
  Future<List<UserModel>> findUsers() async {
    try {
      if (await networkService.hasConnexion) {
        final response = await client.get(NetworkPath.users);
        final data = response.data["results"] as List;
        List<UserModel> users =
            data.map((user) => UserModel.fromJson(user)).toList();
        return users;
      } else {
        throw NetworkException();
      }
    } on DioError catch (e) {
      switch (e.response?.statusCode) {
        case 403:
        case 401:
          throw const UnauthorizedException();
        case 500:
          throw ServerException();
        default:
          throw UnknownException();
      }
    } on NetworkException {
      rethrow;
    } on StorageException {
      rethrow;
    } catch (e) {
      throw UnknownException();
    }
  }
}
