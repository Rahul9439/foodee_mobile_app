import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:sizer/sizer.dart';

import 'Utils/mobile_binding.dart';
import 'Utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: route,
          initialRoute: '/',
          defaultTransition: Transition.fade,
          initialBinding: MainBinding(),
        );
      }
    );
  }
}
