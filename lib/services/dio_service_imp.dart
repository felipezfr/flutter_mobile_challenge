import 'package:dio/dio.dart';
import 'package:flutter_mobile_challenge/services/api_service.dart';

class DioServiceImp implements ApiService {
  @override
  Dio getDio({String? gender}) {
    return Dio(
      BaseOptions(
        baseUrl: 'https://randomuser.me/api/',
        queryParameters: {'results': 50, 'gender': gender ?? ""},
      ),
    );
  }
}
