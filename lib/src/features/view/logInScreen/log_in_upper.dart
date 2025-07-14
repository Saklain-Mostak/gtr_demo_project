import 'package:flutter/material.dart';
import 'package:gtr_task/src/features/view/logInScreen/log_in_form.dart';
import 'package:gtr_task/src/features/view_models/log_in_controller.dart';
import 'package:gtr_task/src/shared/widgets/login_widgets/login_registration_header.dart';

// ignore: must_be_immutable
class LogInUpperScreen extends StatelessWidget {
  const LogInUpperScreen({
    super.key,

    required this.height,
    required this.width,
    // ignore: non_constant_identifier_names
    required this.login_controller,

    // ignore: non_constant_identifier_names
  });

  //final ThemeController themeController;
  final double height;
  final double width;
  // ignore: non_constant_identifier_names
  final LoginController login_controller;
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LoginRegistrationHeader(
          height: height,
          width: width,
          login_registration_text: 'SignIn',
        ),

        LogInForm(
          height: height,
          login_controller: login_controller,
          width: width,
        ),
      ],
    );
  }
}
