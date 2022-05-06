import 'package:dio/dio.dart';
import 'package:flutter_mobile_challenge/services/api_service.dart';

class DioServiceImp implements ApiService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
          baseUrl: 'https://randomuser.me/api/',
          queryParameters: {'results': 4}),
    );
  }
}
