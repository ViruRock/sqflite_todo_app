import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../home/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'splash_screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: FlutterLogo(
        size: 200,
      ),
    );
  }

  void goToNextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(
        navigatorKey.currentContext!,
        HomeScreen.routeName,
      ),
    );
  }
}
