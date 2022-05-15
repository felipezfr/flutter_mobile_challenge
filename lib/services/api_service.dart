import 'package:dio/dio.dart';

abstract class ApiService {
  Dio getDio({String? gender});
}
