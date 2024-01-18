import 'dart:async';

import 'package:blog_app/core/route/app_routes.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_images.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/utils/device_utils.dart';
import 'package:blog_app/view/screens/home/home/home_screen.dart';
import 'package:blog_app/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:blog_app/view/widgets/buttons/custom_elevated_button.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    DeviceUtils.allScreenUtils();
    Timer(const Duration(seconds: 3), () {
       Get.offAllNamed(AppRoutes.homeScreen);
      // Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()));
    });
    super.initState();
  }
  @override
  void dispose() {
    DeviceUtils.allScreenUtils();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     mq=MediaQuery.of(context).size;
    return Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: mq.height * .1,),
                CustomImage(imageSrc: 'assets/images/apple phone number logo.png',imageType: ImageType.png,size: 250.h,),
              // SizedBox(height: mq.height * .04,),
               CustomImage(imageSrc: AppImages.gasFire,imageType: ImageType.png,size: 250.h,),
              // SizedBox(height: 16.h,),
              CustomText(
                text: AppStrings.weThrowGas,
                fontSize: 20.h,
                fontWeight: FontWeight.w500,
                color: AppColors.red_500,
              )
            ],
          ),
        ),
    );
  }
}
