import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gtr_task/src/core/constants/colors.dart';
import 'package:gtr_task/src/core/constants/text_style.dart';

class Customtextformfield extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  //final TextInputType keyboardType;
  final IconButton? suffixIcon;
  final String? Function(String?)? validator;
  final Color? errorColor;

  const Customtextformfield(
      {super.key,
      required this.labelText,
      required this.hintText,
      this.controller,
      this.obscureText = false,
     // required this.keyboardType,
      this.validator,
      this.suffixIcon,
      this.errorColor = Colors.amber});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
       // keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
            contentPadding:  EdgeInsets.all(19.w),
            labelStyle: AppTextStyle.bodyMedium,
            filled: true,
            fillColor:AppColors.appBGColor,
            hintText: hintText,
            suffixIcon: suffixIcon,
            labelText: labelText,
            border:  OutlineInputBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    topRight: Radius.circular(25.r))),
            errorStyle: AppTextStyle.titlemedium),
      ),
    );
  }
}
