import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiPath {
  static String get baseUrl => dotenv.env['BASE_URL_USER'] ?? "";
  static String get imageBaseUrl => dotenv.env['BASE_URL_IMAGE'] ?? "";
  static String get loginEndPoint => dotenv.env['LOGIN_END_POINT'] ?? "";
  static String get customerEndPoint => dotenv.env['CUSTOMER_END_POINT'] ?? "";

  static String get logIn => '$baseUrl$loginEndPoint';
  static String get customerList => '$baseUrl$customerEndPoint';
  
}
