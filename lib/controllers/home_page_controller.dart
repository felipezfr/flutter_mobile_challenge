import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository.dart';

class HomeController {
  final UsersRepository _repository;
  HomeController(this._repository) {
    fetchUsers();
  }

  ValueNotifier<Users?> users = ValueNotifier<Users?>(null);
  Users? _cacheUsers;

  onChanged(String value) {
    var list = _cacheUsers!.results
        .where(
          (element) => element.name.first.toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    debugPrint(list.toString());
    users.value = users.value!.copyWith(results: list);
  }

  void fetchUsers() async {
    var result = await _repository.getUsers();
    users.value = result;
    _cacheUsers = result;
  }
}
