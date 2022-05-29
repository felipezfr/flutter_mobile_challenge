import 'package:flutter_mobile_challenge/model/user_model.dart';

abstract class IUsersRepository {
  Future<Users> getUsers({String? gender});
}
