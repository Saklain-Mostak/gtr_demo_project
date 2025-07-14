import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:gtr_task/src/core/api/api_path.dart';
import 'package:gtr_task/src/features/models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginApiServices {
  Future<UserModel?> authService(
    String userName,
    String password,
    int comId,
  ) async {
    //var isLoading = false.obs;

    final url = Uri.parse(
      "${ApiPath.baseUrl}LogIn?UserName=$userName&Password=$password&ComId=$comId",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        Get.snackbar("Error", "No response");
      }
    } catch (e) {
      if (kDebugMode) {
        print("The Exception is $e");
      }
    }
    return null;
  }
}
