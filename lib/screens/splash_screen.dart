import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/controllers/auth_controller.dart';
import 'package:google_drive_clone/screens/login_screen.dart';
import 'package:google_drive_clone/widgets/bottom_nav_bar.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  // using the put() method from the Get instance to inject the AuthController into
  // this Login UI

  // the put() method takes the instance of the Get controller or dependency
  // that we want to initialize / inject in the UI
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    // using the Obx() widget to listen to the changes in the Rx<User> state and
    // based on that navigate the uset to the different screens
    return Obx(() {
      // using the _authController.user.value since we want to listen to the value
      // of the reactive user variable
      return _authController.user.value == null
          ? const LoginScreen()
          : const BottomNavBar();
    });
  }
}
