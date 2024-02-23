import 'package:flutter/material.dart';
import 'package:flutter_task/routes/app_screens.dart';
import 'package:flutter_task/utils/themes.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme:KTheme.light_theme,
          darkTheme: KTheme.dark_theme,
          themeMode:ThemeMode.system,
          smartManagement: SmartManagement.full,
          getPages: AppPages.routes,
          initialRoute:AppPages.INITIAL_ROUTE,
        );
      },
    );
  }
}
