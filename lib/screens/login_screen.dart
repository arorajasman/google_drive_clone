import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/controllers/auth_controller.dart';
import 'package:google_drive_clone/utilities/color_utils.dart';
import 'package:google_drive_clone/utilities/text_utilities.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onLoginButtonPressed() {
    // using the find<AuthController>() method from the Get instance to find the
    // auth controller and then use the login() method to login the user into the
    // app
    Get.find<AuthController>().login();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurpleAccent,
            Colors.purpleAccent,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildIconUI(context),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 35.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.white, spreadRadius: 5),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Simplify Your",
                      style: getTextStyle(
                          25, const Color(0xFF635C9B), FontWeight.w700),
                    ),
                    Text(
                      "filling system",
                      style: getTextStyle(
                          25, const Color(0xFF635C9B), FontWeight.w700),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      "Keep your files",
                      style: getTextStyle(20, textColor, FontWeight.w600),
                    ),
                    Text(
                      "organized more easily",
                      style: getTextStyle(20, textColor, FontWeight.w600),
                    ),
                    const SizedBox(height: 30.0),
                    _buildSignInButtonUI(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell _buildSignInButtonUI(BuildContext context) {
    return InkWell(
      onTap: onLoginButtonPressed,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.7,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.deepOrangeAccent.withOpacity(0.8),
        ),
        child: Center(
          child: Text(
            "Let's go",
            style: getTextStyle(23, Colors.white, FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Padding _buildIconUI(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).viewInsets.top + 52,
      ),
      child: Image.asset(
        "assets/images/filemanager.png",
        width: 200,
        height: 200,
        fit: BoxFit.cover,
      ),
    );
  }
}
