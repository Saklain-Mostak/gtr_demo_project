import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtr_task/src/core/constants/colors.dart';

class AppTextStyle{

  static TextStyle bodybig = GoogleFonts.inter(
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.0,
    color: AppColors.appTextColor
  );

  static TextStyle bodyMedium = GoogleFonts.inter(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.appTextColor.withValues(alpha: 0.9),
    letterSpacing: 0.0,
 
  );

    static TextStyle titlemedium = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    letterSpacing: 0.0,
    color: AppColors.errorColor
  );






}