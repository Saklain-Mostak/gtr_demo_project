import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gtr_task/src/features/view/home/home_screen.dart';
import 'package:gtr_task/src/features/view/logInScreen/log_in_page.dart';
import 'package:gtr_task/src/features/view_models/customer_controller.dart';
import 'package:gtr_task/src/features/view_models/log_in_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await GetStorage.init();
  Get.put(LoginController());

  Get.put(CustomerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        final box = GetStorage();
        final bool isLoggedIn = box.read("token") != null;

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          home:
              //HomePage()
              // AllCustomerList(textItemHead: 'hghjfhjf', textIem: '5454345',)
              isLoggedIn ? HomePage() : LogIn(),
        );
      },
    );
  }
}
