import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository.dart';
import 'package:flutter_mobile_challenge/services/api_service.dart';

class UsersRepositoryImp implements UsersRepository {
  final ApiService _dioService;

  UsersRepositoryImp(this._dioService);

  @override
  Future<Users> getUsers({String? gender}) async {
    try {
      var result = await _dioService.getDio(gender: gender).get("");
      var data = Users.fromJson(result.data);
      return data;
    } catch (e) {
      throw Exception("Erro ao buscar dados");
    }
  }
}
