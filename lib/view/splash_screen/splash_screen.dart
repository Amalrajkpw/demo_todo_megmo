import 'package:demo_todo_megmo/services/services.dart';
import 'package:demo_todo_megmo/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {


    super.initState();
    AppServices.getData();
    Future.delayed(Duration(seconds: 2), () {
      Get.offNamed(Routes.homeScreenRoute);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade800, Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdni.iconscout.com/illustration/premium/thumb/todo-list-5523307-4609476.png',
              // Make sure to add your image in the assets folder
              height: 300.h,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
