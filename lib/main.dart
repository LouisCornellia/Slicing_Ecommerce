import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:slicing_application/controllers/auth_controller.dart';
import 'package:slicing_application/controllers/theme_controller.dart';
import 'package:slicing_application/page/splashpage.dart';
import 'package:slicing_application/utils/themes.dart';

void main() async {
  GetStorage.init;
  Get.put(ThemeController());
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "E-commerce App",
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: themeController.theme,
      defaultTransition: Transition.fade,
      home: Splashpage(),
    );
  }
}
