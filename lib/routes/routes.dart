import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../screens/add_task/add_task.dart';
import '../screens/home/view/home_screen.dart';
import '../screens/splash/view/splash_screen.dart';
import '../widgets/show_app_bar.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      deviceHeight = MediaQuery.of(context).size.height;
      deviceWidth = MediaQuery.of(context).size.width;

      switch (settings.name) {
        case SplashScreen.routeName:
          return const SplashScreen();
        case HomeScreen.routeName:
          return const HomeScreen();
        case AddTaskScreen.routeName:
          return const AddTaskScreen();
        default:
          return errorRoute();
      }
    });
  }

  static dynamic errorRoute() {
    return Scaffold(
      appBar: showAppBar(),
      body: const Center(
        child: Text("Something Went Wrong!!"),
      ),
    );
  }
}
