import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository.dart';

class HomeController {
  final UsersRepository _repository;
  HomeController(this._repository) {
    fetchUsers();
  }

  ValueNotifier<Users?> users = ValueNotifier<Users?>(null);
  ValueNotifier<bool> loading = ValueNotifier<bool>(false);

  String? _gender;

  Users? _cacheUsers;

  late final ScrollController scrollController;

  infiniteScrolling() {
    if (scrollController.position.pixels + 350 >=
            scrollController.position.maxScrollExtent &&
        loading.value == false) {
      fetchUsers();
    }
  }

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

  onChangeFilter(String? value) {
    _gender = value;
    users.value = null;
    fetchUsers();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void fetchUsers() async {
    loading.value = true;

    var result = await _repository.getUsers(gender: _gender);

    _cacheUsers?.results.addAll(result.results);

    users.value != null ? users.value = _cacheUsers : users.value = result;

    _cacheUsers = result;
    loading.value = false;
  }
}
