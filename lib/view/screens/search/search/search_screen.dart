import 'package:blog_app/core/helper/date_converter.dart';
import 'package:blog_app/core/route/app_routes.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_images.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/view/screens/search/search_controller/search_controller.dart';
import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:blog_app/view/widgets/container/custom_container.dart';
import 'package:blog_app/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  /* SearchPostController searchPostController =
  Get.find<SearchPostController>();*/

  String title ="";

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.only(top: 16),
          child: NavBar(currentIndex: 1),
        ),
        backgroundColor: AppColors.white,
        body: GetBuilder<SearchPostController>(builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 26.h,
              ),
              controller.isSearch
                  ? const SizedBox()
                  : const CustomAppBar(
                      appBarContent: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // GestureDetector(
                        //     onTap: () {
                        //       Get.back();
                        //     },
                        //     child: const CustomImage(
                        //       imageSrc: AppIcons.chevronLeft,
                        //       imageType: ImageType.svg,
                        //       size: 32,
                        //     )),
                        CustomText(
                          text: AppStrings.search,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: AppColors.black_500,
                        ),
                        // const SizedBox()
                      ],
                    )),
              controller.isLoading
                  ? const Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                /*GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: const CustomImage(
                                  imageSrc: AppIcons.chevronLeft,
                                  imageType: ImageType.svg,
                                  size: 32,
                                )),
                            SizedBox(
                              width: 8.w,
                            ),*/
                                Expanded(
                                  child: CustomTextField(
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    textEditingController:
                                        controller.searchController,
                                    onFieldSubmitted: (p0) {
                                      controller.getSearch();
                                    },
                                    /* onChanged: (value){
                               Future.delayed(Duration(seconds: 2),(){
                                 controller.getSearch();
                               });
                                                      },*/
                                    suffixIcon: IconButton(
                                        onPressed: () {
                                          controller.searchController.clear();
                                          controller.getSearch();
                                        },
                                        icon: const CustomImage(
                                          imageSrc: AppIcons.cross,
                                          imageType: ImageType.svg,
                                        )),
                                    hintText: AppStrings.search,
                                    hintStyle: const TextStyle(
                                        color: AppColors.black_200,
                                        fontSize: 16),
                                    fieldBorderColor: AppColors.red_300,
                                    isPrefixIcon: true,
                                    prefix: const Icon(
                                      Icons.search,
                                      size: 24,
                                      color: AppColors.black_200,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: mq.height * .03,
                            ),
                            const CustomText(
                              text: 'Trending News',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.red_500,
                            ),
                            SizedBox(
                              height: mq.height * .016,
                            ),
                            // yoastHeadJson!.author!.reactive.toString()
                            controller.allPost.isEmpty
                                ? SizedBox(
                                    height: 600.h,
                                    child: const Center(
                                      child: CustomText(
                                        text: 'No match data found',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: List.generate(
                                        controller.allPost.length, (index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.toNamed(AppRoutes.readMoreScreen,

                                              arguments: [

                                                controller.allPost[index],
                                                controller.allPost[index]
                                                    .content!.rendered
                                                    .toString(),
                                                'Most popular'
                                              ]);
                                        },
                                        child: CustomContainer(
                                          isDetails: false,
                                          isDetailsDescription: true,
                                          isBookMarkImage: false,
                                          //widget.data[index].yoastHeadJson!.ogDescription.toString()
                                          //widget.data[index].yoastHeadJson!.schema!.graph![index].articleSection.toString()
                                          mediaText: controller.allPost[index]
                                              .yoastHeadJson!.ogDescription
                                              .toString(),
                                          mediaTitle: controller
                                              .allPost[index].title!.rendered
                                              .toString(),
                                          mediaPerson: controller.allPost[index]
                                              .yoastHeadJson!.author!.reactive
                                              .toString(),
                                          date:
                                              DateConverter.formatValidityDate(
                                                  controller.allPost[index].date
                                                      .toString()),
                                          mediaTag: controller
                                              .allPost[index].slug
                                              .toString(),
                                          mediaDescription: controller
                                              .allPost[index].excerpt!.rendered
                                              .toString(),
                                          detailsDescription: 'Read more',
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes.readMoreScreen,
                                                arguments: [
                                                  controller.allPost[index],
                                                  controller.allPost[index]
                                                      .content!.rendered
                                                      .toString()
                                                ]);
                                          },

                                          content: Container(
                                            width: mq.width,
                                            height: mq.height * .28,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        controller
                                                            .allPost[index]
                                                            .yoastHeadJson!
                                                            .ogImage![0]
                                                            .url
                                                            .toString()),
                                                    fit: BoxFit.fill)),
                                          ),
                                          userIcon: AppIcons.user,
                                          calenderIcon: AppIcons.calendar,
                                          tagIcon: AppIcons.tag,
                                        ),
                                      );
                                    }),
                                  )
                          ],
                        ),
                      ),
                    ),
            ],
          );
        }),
      ),
    );
  }
}
