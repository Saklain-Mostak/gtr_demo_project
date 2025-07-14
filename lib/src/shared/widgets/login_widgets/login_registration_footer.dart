
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gtr_task/src/core/constants/colors.dart';
import 'package:gtr_task/src/core/constants/images.dart';
import 'package:gtr_task/src/core/constants/text_style.dart';

class LogInRegistrationFooter extends StatelessWidget {
  const LogInRegistrationFooter({
    super.key,
    required this.width,
    this.signupSigninText,
    this.haveAccountText,
    this.textButtonWidgetforgetPassword,
    required this.onPressedsignupSigninText,
  });

  final double width;
  final String? signupSigninText;
  final String? haveAccountText;
  final TextButton? textButtonWidgetforgetPassword;
  final VoidCallback onPressedsignupSigninText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,

          child: textButtonWidgetforgetPassword,
        ),
        Center(
          child: Text(
            "OR",
            style: AppTextStyle.titlemedium.copyWith(
              color: AppColors.appTextColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0.w),
          child: SizedBox(
            width: width,
            child: OutlinedButton.icon(
              onPressed: () {},
              label: Text(
                "Sign in with Google",
                style: AppTextStyle.titlemedium.copyWith(
                  color: AppColors.appTextColor,
                ),
              ),
              icon: Image.asset(
                AppImage.googleImage,
                width: 20.h,
                height: 20.w,
              ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              haveAccountText!,
              style: AppTextStyle.titlemedium.copyWith(
                color: AppColors.appTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: onPressedsignupSigninText,
             
              child: Text(
                signupSigninText!,
                style: AppTextStyle.titlemedium.copyWith(
                color: AppColors.forgetColor,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
