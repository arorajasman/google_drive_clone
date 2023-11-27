import 'package:flutter/material.dart';
import 'package:google_drive_clone/utils/app_colors.dart';
import 'package:google_drive_clone/utils/app_strings.dart';
import 'package:google_drive_clone/utils/app_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [Colors.deepPurpleAccent, Colors.purpleAccent],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            _buildIconUI(context),
            const Spacer(),
            _buildBodyUI(context)
          ],
        ),
      ),
    );
  }

  Container _buildBodyUI(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30, right: 30, bottom: 35),
      decoration: _bodyContainerDecoration(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // getting heading text list here
            ..._heading,
            const SizedBox(height: 20.0),
            // getting sub heading text list here
            ..._subHeading,
            const SizedBox(height: 30.0),
            _buildLoginButtonUI(context),
          ],
        ),
      ),
    );
  }

  Container _buildLoginButtonUI(BuildContext ctx) => Container(
        width: MediaQuery.of(ctx).size.width / 1.7,
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.deepOrangeAccent.withOpacity(0.8),
        ),
        child: Center(
          child: Text(
            AppStrings.letsGo,
            style: AppUtils().appTextStyle(23, Colors.white, FontWeight.w700),
          ),
        ),
      );

  // getter for heading
  List<Widget> get _heading => [
        Text(
          AppStrings.simplifyYour,
          style: AppUtils().appTextStyle(
            25,
            const Color(0xFF635C9B),
            FontWeight.w700,
          ),
        ),
        Text(
          AppStrings.filingSystem,
          style: AppUtils().appTextStyle(
            25,
            const Color(0xFF635C9B),
            FontWeight.w700,
          ),
        ),
      ];

  // getter for sub heading
  List<Widget> get _subHeading => [
        Text(
          AppStrings.keepYouFiles,
          style: AppUtils().appTextStyle(
            20,
            AppColors.textColor,
            FontWeight.w600,
          ),
        ),
        Text(
          AppStrings.organizedMoreEasily,
          style: AppUtils().appTextStyle(
            20,
            AppColors.textColor,
            FontWeight.w600,
          ),
        ),
      ];

  BoxDecoration _bodyContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(45.0),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(color: Colors.white, spreadRadius: 5),
      ],
    );
  }

  Padding _buildIconUI(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top + 52),
      child: const Image(
        width: 200.0,
        height: 200.0,
        fit: BoxFit.cover,
        image: AssetImage("assets/images/filemanager.png"),
      ),
    );
  }
}
