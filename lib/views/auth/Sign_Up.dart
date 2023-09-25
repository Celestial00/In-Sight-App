import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insight/Constants/Color.dart';
import 'package:insight/components/Text_Field.dart';
import 'package:insight/components/custom_buttons.dart';
import 'package:insight/controllers/User_Controller.dart';
import 'package:insight/models/User_Profile.dart';
import 'package:insight/utils/FlashToast.dart';
import 'package:insight/utils/Validation.dart';
import 'package:insight/views/Home_Page.dart';
import 'package:insight/views/auth/Sign_In.dart';

class Sign_Up extends StatefulWidget {
  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _cPasswordController = TextEditingController();
  UserController userController = UserController();
  bool isLoadingNow = false;

  String _fullNameError = '';
  String _emailError = '';
  String _passwordError = '';
  String _confirmPasswordError = '';

  void isLoading(bool value) {
    setState(() {
      isLoadingNow = value;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    _passwordController.dispose();
    _cPasswordController.dispose();
    super.dispose();
  }

  // void _validateFields() {
  //   setState(() {
  //     // Reset error messages
  //     _fullNameError = '';
  //     _emailError = '';
  //     _passwordError = '';
  //     _confirmPasswordError = '';

  //     // Perform validation checks
  //     if (nameController.text.isEmpty) {
  //       _fullNameError = 'Full name is required';
  //     }

  //     if (emailController.text.isEmpty) {
  //       _emailError = 'Email is required';
  //     } else if (!_isValidEmail(emailController.text)) {
  //       _emailError = 'Invalid email format';
  //     }

  //     if (_passwordController.text.isEmpty) {
  //       _passwordError = 'Password is required';
  //     } else if (_passwordController.text.length < 6) {
  //       _passwordError = 'Password must be at least 6 characters';
  //     }

  //     if (_cPasswordController.text != _passwordController.text) {
  //       _confirmPasswordError = 'Passwords do not match';
  //     }

  //     // If any validation checks fail, show a Snackbar
  //     if (_fullNameError.isNotEmpty ||
  //         _emailError.isNotEmpty ||
  //         _passwordError.isNotEmpty ||
  //         _confirmPasswordError.isNotEmpty) {
  //       print("Please fix the errors in the form.");
  //       // _showErrorSnackbar('Please fix the errors in the form.');
  //     } else {
  //       print("Suceesfully");
  //      userController.registerWithEmailAndPassword(context, emailController.text, _passwordController.text, nameController.text);
  //       // Perform sign-up logic here if all fields are valid
  //       // Call your sign-up function and navigate to the next screen
  //     }
  //   });
  // }
  // bool _isValidEmail(String email) {
  //   // Add your email validation logic here, e.g., using a regular expression
  //   // Return true if email is valid, false otherwise
  //   return true; // Change this based on your validation criteria
  // }
  // // void _showErrorSnackbar(String message) {
  // //   final snackBar = SnackBar(
  // //     content: Text(message),
  // //     duration: Duration(seconds: 3),
  // //   );
  // // }

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
                "Join InSight",
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
              hint: "Full name",
              controller: nameController,
            ),
            SizedBox(
              height: screenHeight * 0.02,
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
              height: screenHeight * 0.02,
            ),
            Text_Field(
              hint: "Confirm Password",
              controller: _cPasswordController,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Custom_Button(
              text: "Sign Up",
              onPressed: () {
                _validateFields();
              },
              isIcon: false,
              btn_color: Sec_Color,
              text_color: Colors.white,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Custom_Button(
              onPressed: () {},
              text: 'Sign Up with Google',
              isIcon: true,
              text_color: Sec_Color,
              pre_icon: "assets/google.png",
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: GoogleFonts.roboto(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.normal,
                    color: Sec_Color,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => Sign_In());
                  },
                  child: Text(
                    "Sign in",
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

  void _validateFields() {
    if (nameController.text.trim().isEmpty &&
        emailController.text.trim().isEmpty &&
        _passwordController.text.trim().isEmpty &&
        _cPasswordController.text.trim().isEmpty) {
      FlashToast.flushBarErrorMessage('Enter your complete details', context);
    } else if (nameController.text.trim().isEmpty) {
      FlashToast.flushBarErrorMessage('Enter your full name', context);
    } else if (emailController.text.trim().isEmpty) {
      FlashToast.flushBarErrorMessage('Enter your email', context);
    } else if (_passwordController.text.trim().isEmpty) {
      FlashToast.flushBarErrorMessage('Enter your password', context);
    } else if (_cPasswordController.text.trim().isEmpty) {
      FlashToast.flushBarErrorMessage(
          'Enter your password again to confirm', context);
    } else if (Validator.validateEmail(emailController.text) != null) {
      FlashToast.flushBarErrorMessage('Invalid Email', context);
    } else if (_passwordController.text != _cPasswordController.text) {
      FlashToast.flushBarErrorMessage(
          'Enter same password to confirm', context);
    }
    isLoading(true);
    userController
        .registerWithEmailAndPassword(
      context,
      emailController.text,
      _passwordController.text,
      nameController.text,
    )
        .then((value) {
      isLoading(false);
      Get.to(HomePage());
    });
  }
}
