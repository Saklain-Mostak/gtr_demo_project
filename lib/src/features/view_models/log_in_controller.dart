import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gtr_task/src/features/services/login_api_services.dart';
import 'package:gtr_task/src/features/view/home/home_screen.dart';
import 'package:gtr_task/src/features/view/logInScreen/log_in_page.dart';
import '../models/user_model.dart';

class LoginController extends GetxController {
  final LoginApiServices _loginApiServices = LoginApiServices();
  final box = GetStorage();

  var isLoading = false.obs;
  Rxn<UserModel> user = Rxn<UserModel>();

  var obscureText = false.obs;
  var logInFromKey = GlobalKey<FormState>();

  TextEditingController logInEmailController = TextEditingController();
  TextEditingController logInPasswordController = TextEditingController();

  String? validemail(String? value) {
    // ignore: unnecessary_null_comparison
    if (value == null || value.isEmpty) {
      return "Email is required";
      // Get.snackbar("Insert email?", "Email is required");
    }
    String pattern =
        r'^[a-zA-Z0-9]+([._%+-]?[a-zA-Z0-9]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z]{2,})+$';
    RegExp regex = RegExp(pattern);

    if (!regex.hasMatch(value)) {
      return 'Enter a valid email';
    } else if (!value.contains('.')) {
      return 'Email must contain a domain (e.g., .com)';
    }
    return null;
  }

  String? validpassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // if (!value.contains(RegExp(r'[A-Z]'))) {
    //   return 'Password must contain at least one uppercase letter';
    // }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least lowercase letter';
    }

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number';
    }

    // if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    //   return 'Password must contain at least one special character';
    // }
    return null;
  }

  Future<void> login(String userName, String password, int comId) async {
    isLoading.value = true;

    final result = await _loginApiServices.authService(
      userName,
      password,
      comId,
    );
    if (result != null && result.token != null) {
      box.write('user', result.toJson());
      box.write('token', result.token);

      user.value = result;
      // print("===============******************================${result.token}\n ${result.userName}\n${result.companyUserList![index].text}");
      Get.offAll(() => HomePage());
    } else {
      Get.snackbar("Login Failed", "Invalid credentials");
    }

    isLoading.value = false;
  }

  bool isLoggedIn() => box.read('token') != null;

  UserModel? getStoredUser() {
    final data = box.read('user');
    if (data != null) {
      return UserModel.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }

  void logOut() {
    box.remove("token");
    box.remove("user");
    user.value = null;

    Get.offAll(() => LogIn());
  }
}
