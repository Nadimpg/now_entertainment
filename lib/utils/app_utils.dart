import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TostMessage {
  static warningSnakbar(
      {required BuildContext context,
      required title,
      int duration = 4,
      IconData icon = Icons.error}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: SizedBox(
          height: 30,
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              Expanded(
                  child: CustomText(
                text: title,
                color: Colors.white,
              )),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.up,
        backgroundColor: Colors.pink,
        duration: Duration(seconds: duration),
      ),
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.pink,
      textColor: Colors.white,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_LONG,
    );
  }

  // static toastMessageCenter({required String message}) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     backgroundColor: AppColors.pink100,
  //     gravity: ToastGravity.CENTER,
  //     toastLength: Toast.LENGTH_LONG,
  //     textColor: AppColors.white100,
  //   );
  // }

  static snackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.pink,
        colorText: Colors.white,
        duration: const Duration(seconds: 3));
  }
}
