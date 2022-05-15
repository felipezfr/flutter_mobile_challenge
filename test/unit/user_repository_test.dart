import 'package:flutter_mobile_challenge/repositories/users_repository_imp.dart';
import 'package:flutter_mobile_challenge/services/dio_service_imp.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test HomeController', () {
    test('Deve retornar um usuario', () async {
      final _repository = UsersRepositoryImp(DioServiceImp());

      var result = await _repository.getUsers();

      expect(result, isNotNull);
    });
  });
}
