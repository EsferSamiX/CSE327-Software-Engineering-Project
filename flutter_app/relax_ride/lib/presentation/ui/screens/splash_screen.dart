import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/screens/main_bottom_nav.dart';
import 'package:relax_ride/presentation/ui/screens/onboarding_screen.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  MainController mainController = Get.find();
  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }

  void moveToNextScreen() async {
    bool state = mainController.box.hasData('data');
    await Future.delayed(const Duration(seconds: 2));
    debugPrint('Data: ${mainController.box.hasData('data')}');
    if (state) {
      Get.offAll(const MainBottomNav());
    } else {
      Get.offAll(const OnboardingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            const AppLogo(),
            const Spacer(),
            CircularProgressIndicator(
              color: Colors.teal.shade600,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Version 2.0.1',
              style: TextStyle(
                color: Colors.teal.shade800,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}