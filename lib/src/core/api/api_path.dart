import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiPath {
  // static const baseUrl = "https://www.pqstec.com/InvoiceApps/Values/";
  // static const imagepathBaseUrl = "https://www.pqstec.com/InvoiceApps";
  // static const loginEndPoint =
  //     "LogIn?UserName=admin@gmail.com&Password=admin1234&ComId=1";
   //    



// final baseUrl= dotenv.env['BASE_URL_USER'];
// final imagepathBaseUrl= dotenv.env['BASE_URL_IMAGE'];
// final loginEndPoint= dotenv.env['LOGIN_END_POINT'];
// final customerEndPoint= dotenv.env['CUSTOMER_END_POINT'];



//   static final logIn = "$baseUrl$loginEndPoint";
//   static final customerList = "$baseUrl$customerListEndPoint";


  static String get baseUrl => dotenv.env['BASE_URL_USER']??"";
  static String get imageBaseUrl => dotenv.env['BASE_URL_IMAGE']??"";
  static String get loginEndPoint => dotenv.env['LOGIN_END_POINT']??"";
  static String get customerEndPoint => dotenv.env['CUSTOMER_END_POINT']??"";


  static String get logIn => '$baseUrl$loginEndPoint';
  static String get customerList => '$baseUrl$customerEndPoint';



}
