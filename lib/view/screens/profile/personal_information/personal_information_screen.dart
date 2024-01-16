import 'dart:io';

import 'package:blog_app/core/route/app_routes.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/view/screens/profile/edit_profile/edit_profile_controller.dart';
import 'package:blog_app/view/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:blog_app/view/screens/profile/profile/profile_screen.dart';
import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({super.key});

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen()));
                      Get.to(const ProfileScreen(),transition: Transition.noTransition);
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 12.w,),
                        const CustomImage(
                          imageSrc: AppIcons.chevronLeft,
                          imageType: ImageType.svg,
                          size: 32,
                        ),
                      ],
                    )),
                CustomText(
                  text: AppStrings.personalInformation,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.h,
                  color: AppColors.black_500,
                ),
                const SizedBox()
              ],
            )
          )),
      body: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraint){
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 24,horizontal: 20),
              child:GetBuilder<ProfileController>(
                builder: (controller){
                  return Column(
                    children: [
                      SizedBox(height: 44.h,),
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -40,
                            right: 20,
                            child: GestureDetector(
                              onTap: (){
                               /* Get.toNamed(AppRoutes.editProfileScreen,arguments: [
                                  controller.profileDetails['image'],
                                  controller.profileDetails['name'],
                                  controller.profileDetails['email'],
                                  controller.profileDetails['contact'],
                                  controller.profileDetails['address'],
                                ]);*/
                                Get.to(EditProfileScreen(),transition: Transition.noTransition,arguments: [
                                  controller.profileDetails['image'],
                                  controller.profileDetails['name'],
                                  controller.profileDetails['email'],
                                  controller.profileDetails['contact'],
                                  controller.profileDetails['address'],
                                ]);
                              },
                              child: Container(
                                padding:const EdgeInsets.all(12),
                                height: 100,
                                decoration: const BoxDecoration(
                                    color: AppColors.red_50,
                                    shape: BoxShape.circle
                                ),
                                child: const CustomImage(imageSrc: AppIcons.pencil,imageType: ImageType.svg,size: 24,),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.red_500,width: 2.w,),
                                  shape: BoxShape.circle
                              ),
                              child: controller.profileDetails['image'] !=null ?
                              Container(
                                height: 108.h,
                                width: 108.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(image: FileImage(File(controller.profileDetails['image']),),
                                      fit: BoxFit.cover,
                                    ),
                                    shape: BoxShape.circle
                                ),
                              )
                                  :Container(
                                height: 108.h,
                                width: 108.w,
                                decoration:const BoxDecoration(
                                  image: DecorationImage(image: AssetImage('assets/images/photo.png')),
                                ),
                              ),
                            ),
                          ),

                        ],
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
                          border: Border.all(color: AppColors.red_500,width: 1),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Name :',
                                  fontSize: 16,
                                  color: AppColors.black_500,
                                ),
                                CustomText(
                                  text: controller.profileDetails['name'] ?? "name",
                                  fontSize: 16,
                                  color: AppColors.black_500,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Email :',
                                  fontSize: 16,
                                  color: AppColors.black_500,
                                ),
                                CustomText(
                                  text: controller.profileDetails['email'] ?? "email",
                                  fontSize: 16,
                                  color: AppColors.black_500,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText(
                                  text: 'Contact :',
                                  fontSize: 16,
                                  color: AppColors.black_500,
                                ),
                                CustomText(
                                  text: controller.profileDetails['contact'] ?? "contact",
                                  fontSize: 16,
                                  color: AppColors.black_500,
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomText(
                                  text: 'Address :',
                                  fontSize: 16,
                                  color: AppColors.black_500,
                                ),
                                Flexible(
                                  child: CustomText(
                                    maxLines: 3,
                                    text: controller.profileDetails['address'] ?? "address",
                                    fontSize: 16,
                                    color: AppColors.black_500,

                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              )
            );
          }
      ),
    );
  }
}
