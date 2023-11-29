import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/controllers/auth_controller.dart';
import 'package:google_drive_clone/screens/login_screen.dart';
import 'package:google_drive_clone/screens/nav_screen.dart';

class SplashScreen extends StatelessWidget {
  // using the put() method from the Get instance to inject the authController
  // dependency here using the dependency injection to authenticate the user
  final AuthController _authController = Get.put(AuthController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // using the Obx() i.e the reactive stream builder that listen and changes
    // according to the reactive states provided by the getx
    return Obx(() {
      // the code below is used to check that if the value of the currentFirebaseUser
      // is null then go to login screen else go to NavScreen()
      return _authController.currentFirebaseUser.value == null
          ? LoginScreen()
          : const NavScreen();
    });
  }
}
