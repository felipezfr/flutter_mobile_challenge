import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository.dart';

class HomeController {
  final UsersRepository _repository;
  HomeController(this._repository) {
    fetchUsers();
  }

  ValueNotifier<Users?> users = ValueNotifier<Users?>(null);

  void fetchUsers() async {
    var result = await _repository.getUsers();
    users.value = result;
  }
}
