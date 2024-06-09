import 'package:demo_todo_megmo/utils/app_theme_factory.dart';
import 'package:demo_todo_megmo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'dart:ui';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 780),
      builder: (BuildContext context, Widget? widget) => const TodoAppMegmo(),
    ),
  );
}

class TodoAppMegmo extends StatelessWidget {
  const TodoAppMegmo({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo Megmo',
      theme: AppThemeFactory.lightTheme,
      initialRoute: Routes.homeScreenRoute,
      getPages: Routes.pages,
    );
  }
}
