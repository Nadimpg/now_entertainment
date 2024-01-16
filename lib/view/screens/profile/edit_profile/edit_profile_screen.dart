import 'dart:io';

import 'package:blog_app/core/route/app_routes.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/utils/app_utils.dart';
import 'package:blog_app/view/screens/profile/edit_profile/edit_profile_controller.dart';
import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/buttons/custom_elevated_button.dart';
import 'package:blog_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  ProfileController profileController=Get.find<ProfileController>();
@override
  void initState() {
   var image=Get.arguments[0];
   var name=Get.arguments[1];
   var email=Get.arguments[2];
  var contact =Get.arguments[3];
  var address=Get.arguments[4];

   profileController.image=image;
  profileController.nameController=TextEditingController(text: name);
  profileController.emailController=TextEditingController(text: email);
  profileController.contactController=TextEditingController(text: contact);
  profileController.addressController=TextEditingController(text: address);

    super.initState();
  }
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
                        Get.back();
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
                    text: AppStrings.editProfile,
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
                  builder: (controller) {
                    return Form(
                      autovalidateMode:AutovalidateMode.always,
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 44.h,),
                          /// Load Image
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.red_500,width: 2.w,),
                                  shape: BoxShape.circle
                              ),
                              child: controller.image !=null ?
                              Container(
                                height: 108.h,
                                width: 108.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: FileImage(File(controller.image!),),
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
                          SizedBox(height: 44.h,),

                          ///Image picker button
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                controller.selectImage();
                              },
                              child: Container(
                                width: 180.w,
                                padding: EdgeInsets.all(12.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.red_500,
                                  borderRadius: BorderRadius.circular(8)
                                ),
                                child: const Row(
                                  children: [
                                    CustomImage(imageSrc: AppIcons.camera,imageType: ImageType.svg,size: 12,),
                                    Flexible(
                                      child: CustomText(
                                        text: AppStrings.uploadPicture,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w500,
                                        left: 4,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                          /// Edit name
                          CustomText(
                            text: AppStrings.name,
                            fontSize: 16,
                            color: AppColors.black_500,
                            bottom: 8.h,
                            top: 24.h,
                          ),
                          CustomTextField(
                            textEditingController: controller.nameController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            hintText: AppStrings.enterYourName,
                            hintStyle: GoogleFonts.prompt(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black_200),
                            inputTextStyle: GoogleFonts.prompt(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.h,
                                color: AppColors.black_400),
                            fieldBorderColor: AppColors.black_50,
                            fieldBorderRadius: 8,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can not be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                          ///edit email
                          CustomText(
                            text: AppStrings.email,
                            fontSize: 16,
                            color: AppColors.black_500,
                            bottom: 8.h,
                            top: 12.h,
                          ),
                          CustomTextField(
                            textEditingController: controller.emailController,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            hintText: AppStrings.enterEmail,
                            hintStyle: GoogleFonts.prompt(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black_200),
                            inputTextStyle: GoogleFonts.prompt(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.h,
                                color: AppColors.black_400),
                            fieldBorderColor: AppColors.black_50,
                            fieldBorderRadius: 8,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can not be empty";
                              } else if (!AppStrings.emailRegexp
                                  .hasMatch(controller.emailController.text)) {
                                return 'enter valid email';
                              } else {
                                return null;
                              }
                            },
                          ),
                          ///edit contact
                          CustomText(
                            text: AppStrings.contact,
                            fontSize: 16,
                            color: AppColors.black_500,
                            bottom: 8.h,
                            top: 12.h,
                          ),
                          CustomTextField(
                            textEditingController: controller.contactController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                            hintText: AppStrings.enterContactNumber,
                            hintStyle: GoogleFonts.prompt(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black_200),
                            inputTextStyle: GoogleFonts.prompt(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.h,
                                color: AppColors.black_400),
                            fieldBorderColor: AppColors.black_50,
                            fieldBorderRadius: 8,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "This field can not be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                          ///edit address
                          CustomText(
                            text: AppStrings.address,
                            fontSize: 16,
                            color: AppColors.black_500,
                            bottom: 8.h,
                            top: 12.h,
                          ),
                          CustomTextField(
                            textEditingController: controller.addressController,
                            maxLines: 5,
                            keyboardType: TextInputType.text,
                            textAlign: TextAlign.start,
                            hintText: AppStrings.enterAddress,
                            hintStyle: GoogleFonts.prompt(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.black_200),
                            inputTextStyle: GoogleFonts.prompt(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.h,
                                color: AppColors.black_400),
                            fieldBorderColor: AppColors.black_50,
                            fieldBorderRadius: 8,
                            validator: (value) {
                              if (value!.isEmpty) {
                               return "This field can not be empty";
                              } else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }
                )
            );
          }
      ),
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.h),
        child: CustomElevatedButton(onPressed: (){
          if(profileController.image ==null){
            return TostMessage.toastMessage(message: 'Image can not be empty');
          }
         if(formKey.currentState!.validate()){

           profileController.updateProfile();
           Get.toNamed(AppRoutes.personalInformationScreen,);
           Fluttertoast.showToast(
               msg: "Update SuccessFully",
               toastLength: Toast.LENGTH_SHORT,
               gravity: ToastGravity.CENTER,
               timeInSecForIosWeb: 1,
               backgroundColor: Colors.green,
               textColor: Colors.white,
               fontSize: 16.0
           );
         }
        }, titleText: AppStrings.updateProfile),
      ),
    );
  }
}
