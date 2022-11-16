import 'package:flutter_contact/data/models/user_model.dart';

abstract class UserService {
  Future<List<UserModel>> findUsers();
}
