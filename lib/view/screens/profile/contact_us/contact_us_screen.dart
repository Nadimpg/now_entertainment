import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/buttons/custom_elevated_button.dart';
import 'package:blog_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController subjectController=TextEditingController();
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
                    text: AppStrings.contactUs,
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
                child:Form(
                  autovalidateMode:AutovalidateMode.always,
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///Contact Now
                      SizedBox(height: 100.h,),
                      Center(
                        child: CustomText(
                          text: AppStrings.contactNow,
                          color: AppColors.black_500,
                          fontSize: 16.h,
                        ),
                      ),

                      /// Contact name
                      /*CustomText(
                        text: AppStrings.name,
                        fontSize: 16.h,
                        color: AppColors.black_500,
                        bottom: 8.h,
                        top: 24.h,
                      ),
                      CustomTextField(
                        textEditingController: nameController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        hintText: AppStrings.enterYourName,
                        hintStyle: GoogleFonts.prompt(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black_200),
                        inputTextStyle: GoogleFonts.prompt(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.black_400),
                        fieldBorderColor: AppColors.black_50,
                        fieldBorderRadius: 8,
                      ),*/
                      ///Contact email
                      CustomText(
                        text: AppStrings.email,
                        fontSize: 16.h,
                        color: AppColors.black_500,
                        bottom: 8.h,
                        top: 24.h,
                      ),
                      CustomTextField(
                        textEditingController: emailController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        hintText: AppStrings.enterEmail,
                        hintStyle: GoogleFonts.prompt(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black_200),
                        inputTextStyle: GoogleFonts.prompt(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.black_400),
                        fieldBorderColor: AppColors.black_50,
                        fieldBorderRadius: 8,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field can not be empty";
                          } else if (!AppStrings.emailRegexp
                              .hasMatch(emailController.text)) {
                            return 'enter valid email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      ///subject contact
                      CustomText(
                        text: AppStrings.subject,
                        fontSize: 16.h,
                        color: AppColors.black_500,
                        bottom: 8.h,
                        top: 12.h,
                      ),
                      CustomTextField(
                        textEditingController: subjectController,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        hintText: AppStrings.enterSubject,
                        hintStyle: GoogleFonts.prompt(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black_200),
                        inputTextStyle: GoogleFonts.prompt(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
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
                      ///address address
                    /*  CustomText(
                        text: AppStrings.address,
                        fontSize: 16.h,
                        color: AppColors.black_500,
                        bottom: 8.h,
                        top: 12.h,
                      ),
                      CustomTextField(
                        maxLines: 5,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.start,
                        hintText: AppStrings.enterAddress,
                        hintStyle: GoogleFonts.prompt(
                            fontSize: 16.h,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black_200),
                        inputTextStyle: GoogleFonts.prompt(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.black_400),
                        fieldBorderColor: AppColors.black_50,
                        fieldBorderRadius: 8,
                      ),*/
                      SizedBox(height: 44.h,),
                      ///contact button
                      CustomElevatedButton(onPressed: (){
                        if(formKey.currentState!.validate()){
                          String? encodeQueryParameters(Map<String, String> params) {
                            return params.entries
                                .map((MapEntry<String, String> e) =>
                            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                .join('&');
                          }
                          // ···
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: emailController.text,
                            query: encodeQueryParameters(<String, String>{
                              'subject': subjectController.text,
                            }),
                          );

                          launchUrl(emailLaunchUri);
                        }

                      }, titleText: AppStrings.send,titleSize: 18.h,titleWeight: FontWeight.w600,buttonWidth: mq.width,),
                     /* SizedBox(height: 44.h,),
                      Center(
                        child: CustomText(
                          text: AppStrings.youMayAlso,
                          color: AppColors.black_500,
                          fontSize: 16.h,
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           CustomImage(imageSrc: AppIcons.mail,imageType: ImageType.svg,imageColor: AppColors.red_500,size: 20.h,),
                          CustomText(
                            text: 'contact@nowentertainment.net',
                            fontSize: 16.h,
                            color: AppColors.red_500,
                            left: 4,
                          )
                        ],
                      )*/
                    ],
                  ),
                )
            );
          }
      ),
    );
  }
}
