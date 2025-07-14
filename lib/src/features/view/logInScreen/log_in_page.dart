// ignore_for_file: non_constant_identifier_names
// ignore: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gtr_task/src/core/constants/text_style.dart';
import 'package:gtr_task/src/features/view/logInScreen/log_in_upper.dart';
import 'package:gtr_task/src/features/view_models/log_in_controller.dart';
import 'package:gtr_task/src/shared/widgets/login_widgets/login_registration_footer.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final login_controller=Get.find<LoginController>();
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                LogInUpperScreen(
                 // themeController: themeController,
                  height: height,
                  width: width,
                  login_controller: login_controller,
                ),
                LogInRegistrationFooter(
                  onPressedsignupSigninText: () {
           
                  },
                  width: width,
                  signupSigninText: "SignUp",
                  haveAccountText: "Don't have an account?",
                  textButtonWidgetforgetPassword: TextButton(
                      onPressed: () {},
          
                      child:  Text(
                        "Forget Password?",
                        style: AppTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.normal,color: Colors.blue),
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

