// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtr_task/src/core/constants/colors.dart';
import 'package:gtr_task/src/features/view_models/log_in_controller.dart';
import 'package:gtr_task/src/shared/widgets/login_widgets/custom_text_form_field.dart';
import 'package:gtr_task/src/shared/widgets/login_widgets/lonin_registration_button.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
    required this.height,
    required this.login_controller,
    required this.width,
  });

  final double height;
  final LoginController login_controller;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: login_controller.logInFromKey,

      //login_controller.LogInFormkey,
      child: Column(
        children: [
          SizedBox(height: height / 65),
          Customtextformfield(
            errorColor: AppColors.errorColor,
            validator: login_controller.validemail,
            labelText: "Email",
            hintText: "Ënter a Email",
            controller: login_controller.logInEmailController,
            // keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          SizedBox(height: height / 150),

          Obx(() {
            return Customtextformfield(
              errorColor: AppColors.errorColor,
              validator: login_controller.validpassword,
              labelText: "Password",
              hintText: "Ënter a Password",
              controller: login_controller.logInPasswordController,
              obscureText: login_controller.obscureText.value,
              //   keyboardType: TextInputType.text,
              suffixIcon: IconButton(
                onPressed: () {
                  login_controller.obscureText.value =
                      !login_controller.obscureText.value;
                },

                // ignore: unrelated_type_equality_checks
                icon:
                    login_controller.obscureText.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
              ),
            );
          }),

          LogInRegistrationButton(
            ontap: () {
              if (
              //login_controller!.formkey.currentState!.validate()&&
              login_controller.logInFromKey.currentState!.validate()) {
                login_controller.login(
                  login_controller.logInEmailController.text.trim(),
                  login_controller.logInPasswordController.text.trim(),
                  1,
                );
              } else {
                //Get.snackbar("Failed!", "Please fillup the form");
                // ignore: avoid_print
                print(
                  "==================================LogIn failed====================",
                );
              }
              // ignore: avoid_print
            },
            login_controller: login_controller,
            height: height,
            width: width,
            login_registration_text: 'Sign In',
          ),
        ],
      ),
    );
  }
}



