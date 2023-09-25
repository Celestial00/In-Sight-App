import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
// import 'package:image_picker/image_picker.dart';

class FlashToast {
  static toastMessage(String message) {
    Fluttertoast.showToast(msg: message);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 4),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        // backgroundColor: const Color.fromARGB(255, 90, 89, 89),
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // static Future<File?> pickImage(ImageSource imageSource,
  //     [int quality = 85, double width = 500, double height = 500]) async {
  //   ImagePicker imagePicker = ImagePicker();
  //   var pickedFile = await (imagePicker.pickImage(
  //     source: imageSource,
  //     imageQuality: quality,
  //     maxHeight: height,
  //     maxWidth: width,
  //   ));
  //   if (pickedFile == null) return null;
  //   File imageFile = File(pickedFile.path);
  //   return await compressImage(imageFile);
  // }

  // static Future<File> compressImage(File imageToCompress) async {
  // //  imageToCompress.readAsBytes();
  //   print('size: ${imageToCompress.statSync().size}');
  //   return imageToCompress;
   }