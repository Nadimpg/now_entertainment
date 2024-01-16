
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NoInternetController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  bool isLoading = false;

  Future<bool> checkInternetConnection() async {
    isLoading = true;
    update();

    var connectivityResult = await Connectivity().checkConnectivity();

    Future.delayed(
      const Duration(seconds: 1),
      () {
        isLoading = false;
        update();
      },
    );

    return connectivityResult != ConnectivityResult.none;
  }

  void onConnectivityChange(ConnectivityResult result) {
    if (result == ConnectivityResult.none) {
      Get.rawSnackbar(
          messageText: const CustomText(
            color: AppColors.white,
            text: 'No internet connection',
          ),
          isDismissible: false,
          backgroundColor: AppColors.black_400,
          icon: const Icon(
            Icons.wifi_off_outlined,
            color: AppColors.white,
            size: 35,
          ),
          snackStyle: SnackStyle.FLOATING,
          duration: const Duration(days: 1));

      // Get.offAllNamed(AppRoute.noInternet);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeAllSnackbars();
        //Get.offAllNamed(AppRoute.homeScreen);
      }
    }
  }

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen((event) {
      onConnectivityChange(event);
    });
    super.onInit();
  }
}
