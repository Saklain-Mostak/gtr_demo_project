// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gtr_task/src/core/constants/colors.dart';
import 'package:gtr_task/src/core/constants/text_style.dart';
import 'package:gtr_task/src/features/view_models/log_in_controller.dart';


class LogInRegistrationButton extends StatelessWidget {
  const LogInRegistrationButton(
      {super.key,
      this.login_controller,
      required this.height,
      required this.width,
     // this.registrationController,
      required this.login_registration_text,
      required this.ontap});

  final LoginController? login_controller;
 // final RegistrationController? registrationController;
  final double height;
  final double width;
  final String login_registration_text;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>ontap(),
      child: Padding(
        padding:  EdgeInsets.all(16.0.w),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.forgetColor.withValues(alpha:.5 ),
            borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(27.r), bottomRight: Radius.circular(27.r)),
          ),
          height: height / 14,
          width: width / 2,
          child: Center(
              child: Text(
            login_registration_text.toUpperCase(),
            style:  AppTextStyle.bodyMedium.copyWith(fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
