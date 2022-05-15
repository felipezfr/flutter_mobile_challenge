import 'package:flutter_mobile_challenge/model/user_model.dart';

abstract class UsersRepository {
  Future<Users> getUsers({String? gender});
}
