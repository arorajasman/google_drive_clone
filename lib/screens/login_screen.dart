import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_drive_clone/controllers/auth_controller.dart';
import 'package:google_drive_clone/utils/app_colors.dart';
import 'package:google_drive_clone/utils/app_strings.dart';
import 'package:google_drive_clone/utils/app_utils.dart';

class LoginScreen extends StatelessWidget {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  const LoginScreen({super.key});

  // Updated method to handle login button press
  void _onLoginButtonPressed() {
    // final FormState? form = _formKey.currentState;
    // if (form != null && form.validate()) {
    //   // Form is valid, you can proceed with authentication logic
    //   String email = _emailController.text;
    //   String password = _passwordController.text;

    //   print({email, password});

    // using the find() method of type AuthController to find the AuthController
    // that has been initialized already using the dependency injection and
    // then call the login() method to login the user
    Get.find<AuthController>().login(/*email: email, password: password*/);
  }
  // }

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
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            _buildIconUI(context),
            const SizedBox(height: 20.0),
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
            // getting sub-heading text list here
            ..._subHeading,
            const SizedBox(height: 30.0),
            // _buildAuthFormUI(context),
          ],
        ),
      ),
    );
  }

//   Padding _buildAuthFormUI(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(12, 0, 20, 0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             _buildEmailTextField(),
//             const SizedBox(height: 15.0),
//             _buildPasswordTextField(),
//             const SizedBox(height: 30.0),
//             _buildLoginButtonUI(context),
//           ],
//         ),
//       ),
//     );
//   }

// // New method to build email text field
//   Widget _buildEmailTextField() {
//     return TextFormField(
//       controller: _emailController,
//       keyboardType: TextInputType.emailAddress,
//       decoration: const InputDecoration(
//         labelText: 'Email',
//         icon: Icon(Icons.email),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your email';
//         }
//         // You can add more complex email validation logic here if needed
//         return null;
//       },
//     );
//   }

// // New method to build password text field
//   Widget _buildPasswordTextField() {
//     return TextFormField(
//       controller: _passwordController,
//       obscureText: true,
//       decoration: const InputDecoration(
//         labelText: 'Password',
//         icon: Icon(Icons.lock),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter your password';
//         }
//         // You can add more complex password validation logic here if needed
//         return null;
//       },
//     );
//   }

  InkWell _buildLoginButtonUI(BuildContext ctx) => InkWell(
        onTap: _onLoginButtonPressed,
        child: Container(
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
