import 'package:demo_todo_megmo/view/home_screen/home_screen.dart';
import 'package:demo_todo_megmo/view/splash_screen/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static String splashScreenRoute = "/splash";
  static String homeScreenRoute = "/home";
  static List<GetPage> pages = [
    GetPage(
        name: splashScreenRoute,
        page: () => SplashScreen(),
        ),
    GetPage(
      name: homeScreenRoute,
      page: () => HomeScreen(),
    ),
  ];
}