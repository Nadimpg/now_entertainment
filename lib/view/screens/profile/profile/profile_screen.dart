import 'dart:io';

import 'package:blog_app/core/route/app_routes.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/view/screens/profile/about_us/about_us_screen.dart';
import 'package:blog_app/view/screens/profile/contact_us/contact_us_screen.dart';
import 'package:blog_app/view/screens/profile/edit_profile/edit_profile_controller.dart';
import 'package:blog_app/view/screens/profile/personal_information/personal_information_screen.dart';
import 'package:blog_app/view/screens/profile/privacy_policy/privacy_policy_screen.dart';
import 'package:blog_app/view/screens/profile/terms_condition/terms_condition_screen.dart';
import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const NavBar(
        currentIndex: 2,
      ),
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
          isDetails: true,
          appBarContent: Container(
            width: mq.width,
            height: 64.h,
            decoration: const BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x0F000000),
                  blurRadius: 12,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Center(
              child: CustomText(
                text: 'Settings',
                fontWeight: FontWeight.w500,
                fontSize: 18.h,
                color: AppColors.black_500,
              ),
            ),
          )),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: GetBuilder<ProfileController>(builder: (controller) {
              return Column(
                children: [
                  SizedBox(
                    height: 44.h,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.red_500,
                            width: 2.w,
                          ),
                          shape: BoxShape.circle),
                      child: controller.profileDetails['image'] != null
                          ? Container(
                              height: 108.h,
                              width: 108.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(controller.profileDetails['image']),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle),
                            )
                          : Container(
                              height: 108.h,
                              width: 108.w,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/photo.png')),
                              ),
                            ),
                    ),
                  ),
                  CustomText(
                    text: controller.profileDetails['name'] ?? "name",
                    fontSize: 20.h,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black_500,
                    top: 12.h,
                    bottom: 8.h,
                  ),
                  CustomText(
                    text: controller.profileDetails['email'] ?? "email",
                    fontSize: 16.h,
                    color: AppColors.black_300,
                    bottom: 24.h,
                  ),
                  Container(
                    padding: EdgeInsets.all(16.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.red_500, width: 1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(AppRoutes.personalInformationScreen,);
                            Get.to(const PersonalInformationScreen(),
                                transition: Transition.noTransition);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 16.h),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.black_50, width: 1))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.profile,
                                  imageType: ImageType.svg,
                                  size: 20.h,
                                  imageColor: AppColors.black_500,
                                ),
                                CustomText(
                                  text: AppStrings.personalInformation,
                                  fontSize: 16.h,
                                  color: AppColors.black_500,
                                  left: 12.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(AppRoutes.termsConditionsScreen);
                            Get.to(TermsConditionsScreen(),
                                transition: Transition.noTransition);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 16.h, top: 16.h),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.black_50, width: 1))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.exclamationCircle,
                                  imageType: ImageType.svg,
                                  size: 20.h,
                                  imageColor: AppColors.black_500,
                                ),
                                CustomText(
                                  text: AppStrings.termsConditions,
                                  fontSize: 16.h,
                                  color: AppColors.black_500,
                                  left: 12.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(AppRoutes.privacyPolicyScreen,);
                            Get.to(PrivacyPolicyScreen(),
                                transition: Transition.noTransition);
                          },
                          child: Container(
                            padding: EdgeInsets.only(bottom: 16.h, top: 16.h),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.black_50, width: 1))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.shieldCheck,
                                  imageType: ImageType.svg,
                                  size: 20.h,
                                  imageColor: AppColors.black_500,
                                ),
                                CustomText(
                                  text: AppStrings.privacyPolicy,
                                  fontSize: 16.h,
                                  color: AppColors.black_500,
                                  left: 12.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(AppRoutes.aboutUsScreen);
                            Get.to(const AboutUsScreen(),
                                transition: Transition.noTransition);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                            decoration: const BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: AppColors.black_50, width: 1))),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.informationCircle,
                                  imageType: ImageType.svg,
                                  size: 20.h,
                                  imageColor: AppColors.black_500,
                                ),
                                CustomText(
                                  text: AppStrings.aboutUs,
                                  fontSize: 16.h,
                                  color: AppColors.black_500,
                                  left: 12.w,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(AppRoutes.contactUsScreen);
                            Get.to(const ContactUsScreen(),
                                transition: Transition.noTransition);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 16.h),
                            decoration: const BoxDecoration(),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImage(
                                  imageSrc: AppIcons.mail,
                                  imageType: ImageType.svg,
                                  size: 20.h,
                                  imageColor: AppColors.black_500,
                                ),
                                CustomText(
                                  text: AppStrings.contactUs,
                                  fontSize: 16.h,
                                  color: AppColors.black_500,
                                  left: 12.w,
                                ),
                              ],
                            ),
                          ),
                        ),

                        /* GestureDetector(
                            onTap: (){
                              Get.toNamed(AppRoutes.contactUsScreen);
                            },
                            child: Container(
                              padding:  EdgeInsets.only(top: 16.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   CustomImage(imageSrc: AppIcons.mail,imageType: ImageType.svg,size: 20.h,imageColor: AppColors.black_500,),
                                  CustomText(
                                    text: AppStrings.contactUs,
                                    fontSize: 16.h,
                                    color: AppColors.black_500,
                                    left: 12.w,
                                  ),
                                ],
                              ),
                            ),
                          ),*/
                      ],
                    ),
                  )
                ],
              );
            }),
          );
        },
      ),
    );
  }
}
