import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/view/screens/profile/privacy_policy/privacy_policy_controller.dart';
import 'package:blog_app/view/screens/profile/terms_condition/terms_condition_controller.dart';
import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html_audio/flutter_html_audio.dart';
import 'package:flutter_html_iframe/flutter_html_iframe.dart';
import 'package:flutter_html_svg/flutter_html_svg.dart';
import 'package:flutter_html_table/flutter_html_table.dart';
import 'package:flutter_html_video/flutter_html_video.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsConditionsScreen extends StatefulWidget {
  // List<PrivacyPolicyModel> data;
  TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  // TermsConditionController controlet=  Get.put(TermsConditionController());
  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
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
                    text: AppStrings.termsConditions.tr,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.h,
                    color: AppColors.black_500,
                  ),
                  const SizedBox()
                ],
              )
          )),
      body: GetBuilder<TermsConditionController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 24.h,horizontal: 20.h),
                child:Column(
                  children: [
                    controller.terms.isNotEmpty? Html(
                        shrinkWrap: true,
                        // doNotRenderTheseTags: const {'a'},
                        data:controller.terms[0].content?.rendered ?? "",
                      onLinkTap: (url,arttrobute,element){
                        _launchUrl(url!);
                      },
                      extensions: [
                        TableHtmlExtension(),
                        AudioHtmlExtension(),
                        IframeHtmlExtension(),
                        SvgHtmlExtension(),
                        VideoHtmlExtension(),
                      ],
                      style: {
                        "img": Style(
                          width:Width(200.w),
                        ),
                      },

                    ):SizedBox() ,
                  ],
                )
            );
          }
      ),
    );
  }
}
