import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:gtr_task/src/core/constants/text_style.dart';
import 'package:gtr_task/src/features/view/home/customer_list_demo.dart';
import 'package:gtr_task/src/features/view_models/log_in_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Customer List", style: AppTextStyle.bodybig),
        ),
        actions: [
          InkWell(
            child: Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: Icon(Icons.logout),
            ),
            onTap: () {
              final logincontroller = Get.find<LoginController>();
              
              logincontroller.logOut();
            },
          ),
        ],
      ),

      body: Column(children: [Expanded(child: CustomerInfoList())]),
    );
  }
}
