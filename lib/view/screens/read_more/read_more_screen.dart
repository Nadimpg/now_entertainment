import 'package:blog_app/core/helper/date_converter.dart';
import 'package:blog_app/core/route/app_routes.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_images.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_fashion/home_fashion_model.dart';
import 'package:blog_app/view/widgets/appbar/custom_appbar.dart';
import 'package:blog_app/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:blog_app/view/widgets/container/custom_container.dart';
import 'package:blog_app/view/widgets/image/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadMoreScreen extends StatefulWidget {
  const ReadMoreScreen({super.key});

  @override
  State<ReadMoreScreen> createState() => _ReadMoreScreenState();
}

class _ReadMoreScreenState extends State<ReadMoreScreen> {
  HomeFashionModel data=Get.arguments[0];
  String content=Get.arguments[1];
  String title=Get.arguments[2];
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const NavBar(currentIndex: 0),
      appBar: CustomAppBar(appBarContent: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const CustomImage(
                imageSrc: AppIcons.chevronLeft,
                imageType: ImageType.svg,
                size: 32,
              )),
          CustomImage(
            imageSrc: AppImages.entertainment,
            imageType: ImageType.png,
            size: 52,
          ),
          SizedBox(),

          
        ],
      )),
      body: LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraint){
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 24,
            horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  isDetails: true,
                  isDetailsDescription:false,
                  isBookMarkImage: false,
                  //widget.data[index].yoastHeadJson!.ogDescription.toString()
                  //widget.data[index].yoastHeadJson!.schema!.graph![index].articleSection.toString()
                  mediaText:data.yoastHeadJson!.ogDescription??title,
                  mediaTitle: data.title!.rendered.toString() ?? " ",
                  mediaPerson: data.yoastHeadJson!.author!.reactive.toString(),
                  date: DateConverter.formatValidityDate(data!.date.toString()),
                  mediaTag: data!.slug.toString(),
                  mediaDescription: data.content!.rendered.toString(),
                  detailsDescription: 'Read more',
                  onTap: () {
                    // Get.toNamed(AppRoutes.readMoreScreen,arguments: [data,data[index].content!.rendered.toString()]);
                  },

                  content: Container(
                    width: mq.width,
                    height: mq.height * .28,
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            image:  NetworkImage(data.yoastHeadJson!.ogImage![0].url.toString()),
                            fit: BoxFit.fill)),
                  ),
                  userIcon: AppIcons.user,
                  calenderIcon: AppIcons.calendar,
                  tagIcon: AppIcons.tag,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
