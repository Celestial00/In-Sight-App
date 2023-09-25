import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/Constants/Fonts_Style.dart';
import 'package:insight/components/Text_Field.dart';
import 'package:insight/components/custom_buttons.dart';
import 'package:insight/controllers/User_Controller.dart';
import 'package:insight/services/Auth_Service.dart';
import 'package:insight/utils/FlashToast.dart';
import 'package:insight/utils/Validation.dart';
import 'package:insight/views/Home_Page.dart';
import 'package:insight/views/Main_Page.dart';
import 'package:insight/views/Saved_Articles.dart';

import 'Sign_Up.dart';

class Sign_In extends StatefulWidget {
  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  TextEditingController emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  UserController userController = UserController();
  bool isLoadingNow = false;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: BackGround_Color,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Center(
              child: Text(
                "Welcome Back!",
                style: GoogleFonts.ptSerif(
                  fontSize: screenWidth * 0.1,
                  fontWeight: FontWeight.normal,
                  color: Sec_Color,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text_Field(
              hint: "Email",
              controller: emailController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Text_Field(
              hint: "Password",
              controller: _passwordController,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Custom_Button(
              text: "Sign In",
              onPressed: () {
                setState(() {
                  emailController.text = "abdulshafyq@gmail.com";
                  _passwordController.text = "123456";
                });
                _validateFields();
              },
              text_color: Colors.white,
              isIcon: false,
              btn_color: Sec_Color,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Custom_Button(
              onPressed: () async {
                User? user = await authService.signInWithGoogle();
                if (user != null) {
      // User is signed in, you can navigate to the next screen or perform other actions.
      Get.to(() => HomePage());
    } else {
      // Handle sign-in error or cancellation.
    }
              },
              text: 'Sign in with Google',
              btn_color: Colors.white,
              text_color: Sec_Color,
              isIcon: true,
              pre_icon: "assets/google.png",
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Custom_Button(
              onPressed: () {},
              text: 'Sign in with Facebook',
              btn_color: Colors.white,
              text_color: Sec_Color,
              pre_icon: "assets/twitter.png",
              isIcon: true,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Custom_Button(
              onPressed: () {},
              text: 'Sign in with Twitter',
              btn_color: Colors.white,
              text_color: Sec_Color,
              pre_icon: "assets/twitter.png",
              isIcon: true,
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Ubuntu_Style_Text(
                  text: "Don't have an account?",
                  fontSize: screenWidth * 0.04,
                  color: Sec_Color,
                ),
                SizedBox(
                  width: 2,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => Sign_Up());
                  },
                  child: Text(
                    "Sign up",
                    style: GoogleFonts.roboto(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Sec_Color,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  void _validateFields() {
    if (emailController.text.trim().isEmpty &&
        _passwordController.text.trim().isEmpty) {
      FlashToast.flushBarErrorMessage('Enter your complete details', context);
    } else if (emailController.text.trim().isEmpty) {
      FlashToast.flushBarErrorMessage('Enter your email', context);
    } else if (_passwordController.text.trim().isEmpty) {
      FlashToast.flushBarErrorMessage('Enter your password', context);
    } else if (Validator.validateEmail(emailController.text) != null) {
      FlashToast.flushBarErrorMessage('Invalid Email', context);
    }
    isLoading(true);
    userController
        .signInWithEmailAndPassword(
            context, emailController.text, _passwordController.text)
        .then((value) {
      isLoading(false);
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      //   return HomePage();
      // }));
      Get.to(() => Main_Page());
    });
  }
}
