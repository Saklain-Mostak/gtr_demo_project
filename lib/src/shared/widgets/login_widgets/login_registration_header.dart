// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gtr_task/src/core/constants/images.dart';
import 'package:gtr_task/src/core/constants/text_style.dart';

class LoginRegistrationHeader extends StatelessWidget {
  const LoginRegistrationHeader({
    super.key,
    required this.height,
    required this.width,
    required this.login_registration_text,
  });

  final double height;
  final double width;
  final String login_registration_text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle),
            height: height / 6,
            width: width / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500.r),
              child: Image.network(
                // alignment: Alignment.center,
                AppImage.gtr,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Text(
            login_registration_text,
            textAlign: TextAlign.center,
            style: AppTextStyle.bodybig
            
          ),
        ],
      ),
    );
  }
}
