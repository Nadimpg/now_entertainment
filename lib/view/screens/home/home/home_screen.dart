import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_images.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_category/home_category_controller.dart';
import 'package:blog_app/view/screens/home/inner_widgets/music/home_music_section.dart';
import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/helper/date_converter.dart';
import '../../../../core/route/app_routes.dart';
import '../../../../utils/app_icons.dart';
import '../../../widgets/container/custom_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
/*  HomeCategoryPostController homeCategoryPostController =
      Get.put(HomeCategoryPostController());*/

  HomeCategoryController homeCategoryController =
      Get.find<HomeCategoryController>();

  @override
  void initState() {
    super.initState();
    homeCategoryController.fastLoad();
    homeCategoryController. scrollController = ScrollController(initialScrollOffset: 0.0);
    homeCategoryController.scrollController.addListener(() {
      if ( homeCategoryController.scrollController.position.pixels ==
          homeCategoryController.scrollController.position.maxScrollExtent) {
        homeCategoryController.loadMore();
      }
    });
    String url = "https://www.nowentertainment.net/wp-json/wp/v2/categories?page=1&per_page=25";
    homeCategoryController.getCategory(url);
  }

  String title ="";

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
          bottomNavigationBar: const NavBar(currentIndex: 0),
          backgroundColor: Colors.white,
          appBar: const CustomAppBar(
      appBarContent: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(),
      CustomImage(
        imageSrc: AppImages.entertainment,
        imageType: ImageType.png,
        size: 52,
      ),
      SizedBox()
    ],
          )),
          body: Padding(
    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
    child: Column(
      children: [
        GetBuilder<HomeCategoryController>(builder: (controller) {
          if (controller.isCategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  List.generate(controller.categories.length, (index) {
                return InkWell(
                  onTap: () {
                    controller.selectedTabIndex = index;

                    controller.id[controller.selectedTabIndex];
                    controller.fastLoad();
                    // controller.getPost();

                    title = controller.categories[index].name!;

                    setState(() {});
                  },
                  child: Ink(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border(
                            bottom: BorderSide(
                          width: 1,
                          color: controller.selectedTabIndex == index
                              ? AppColors.red_500
                              : AppColors.white,
                        )),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x1E000000),
                            blurRadius: 8,
                            offset: Offset(0, -2),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: CustomText(
                        text: controller.categories[index].name.toString(),
                        color: AppColors.red_500,
                        fontWeight: FontWeight.w500,
                      )),
                );
              }),
            ),
          );
        }),
        SizedBox(
          height: mq.height * .02,
        ),
        Expanded(child: SingleChildScrollView(
            controller:homeCategoryController.scrollController,
            child:
            GetBuilder<HomeCategoryController>(builder: (controller) {
          if (controller.isFirstLoadRunning.value) {
            return SizedBox(
              height: MediaQuery.of(context).size.height/2,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Obx(()=>
             ListView.builder(
              itemBuilder: (context, index) {
                if(index<controller.AllPost.value.length){
                  var data = controller.AllPost[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.readMoreScreen, arguments: [
                        data,
                        data.content!.rendered.toString(),
                        title
                      ]);
                    },
                    child: CustomContainer(
                      isDetailsDescription: true,
                      isBookMarkImage: false,
                      //widget.data[index].yoastHeadJson!.ogDescription.toString()
                      //widget.data[index].yoastHeadJson!.schema!.graph![index].articleSection.toString()
                      mediaText:
                      data.yoastHeadJson!.ogDescription??title ,
                      mediaTitle: data.title!.rendered.toString() ?? " ",
                      mediaPerson:
                      data.yoastHeadJson!.author!.reactive.toString(),
                      date: DateConverter.formatValidityDate(
                          data.date.toString()),
                      mediaTag: data.slug.toString(),
                      mediaDescription: data.excerpt!.rendered.toString(),
                      detailsDescription: 'Read more',
                      onTap: () {
                        Get.toNamed(AppRoutes.readMoreScreen, arguments: [
                          data,
                          data.content!.rendered.toString()
                        ]);
                      },
                      content: Container(
                        width: mq.width,
                        height: mq.height * .28,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data
                                    .yoastHeadJson!.ogImage![0].url
                                    .toString()),
                                fit: BoxFit.fill)),
                      ),
                      userIcon: AppIcons.user,
                      calenderIcon: AppIcons.calendar,
                      tagIcon: AppIcons.tag,
                    ),
                  );
                }else{
                  if(homeCategoryController.isLoadMoreRunning.value){
                    return const SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: Center(
                          child: CircularProgressIndicator()
                      ),
                    );
                  }else{
                    return SizedBox();
                  }
                }



              },
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.AllPost.length+1,
            ),
          );
        })))
      ],
    ),
          ),
        );
  }
}
