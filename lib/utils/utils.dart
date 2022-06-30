import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:syntech1/res/color.dart';

class Utils {
//for Focus Node
  static void feildFocusChange(
      BuildContext context, FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.white,
        textColor: AppColors.backgroundColor,
        toastLength: Toast.LENGTH_LONG);
  }

  static void flushBarErrorMessages(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          message: message,
          duration: const Duration(seconds: 3),
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          padding: const EdgeInsets.all(15),
          backgroundColor: AppColors.backgroundColor,
          reverseAnimationCurve: Curves.easeInOut,
          positionOffset: 20,
          flushbarPosition: FlushbarPosition.TOP,
          borderRadius: BorderRadius.circular(15),
          icon: const Icon(
            Icons.error,
            size: 28,
            color: AppColors.origionalwhiteColor,
          ),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
