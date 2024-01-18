import 'package:blog_app/core/helper/date_converter.dart';
import 'package:blog_app/core/route/app_routes.dart';
import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_images.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_category_post/home_category_post_model.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_community/home_community_model.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_fashion/home_fashion_model.dart';
import 'package:blog_app/view/widgets/container/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class HomeMusicSection extends StatefulWidget {

  List<HomeFashionModel> data;
   HomeMusicSection({super.key, required this.data});

  @override
  State<HomeMusicSection> createState() => _HomeMusicSectionState();
}

class _HomeMusicSectionState extends State<HomeMusicSection> {
  @override
  Widget build(BuildContext context) {
    mq=MediaQuery.of(context).size;
    return Column(
      children: List.generate( widget.data.length, (index) {
        return GestureDetector(
          onTap: (){
            // Get.toNamed(AppRoutes.readMoreScreen,arguments: [widget.data[index],widget.data[index].content!.rendered.toString()]);
          },
          child: CustomContainer(
            onPressed: ()async{
             var url= widget.data[index].link;
             await Share.share(url!);
            },
            isDetailsDescription:true,
            isBookMarkImage: false,
            //widget.data[index].yoastHeadJson!.ogDescription.toString()
            //widget.data[index].yoastHeadJson!.schema!.graph![index].articleSection.toString()
            mediaText: widget.data[index].yoastHeadJson!.ogDescription.toString(),
            mediaTitle: widget.data[index].title!.rendered.toString() ?? " ",
            mediaPerson: widget.data[index].yoastHeadJson!.author!.reactive.toString(),
            date: DateConverter.formatValidityDate(widget.data[index]!.date.toString()),
            mediaTag: widget.data[index]!.slug.toString(),
            mediaDescription: widget.data[index].excerpt!.rendered.toString(),
            detailsDescription: 'Read more',
            onTap: () {
              // Get.toNamed(AppRoutes.readMoreScreen,arguments: [widget.data[index],widget.data[index].content!.rendered.toString()]);
            },
            content: Container(
              width: mq.width,
              height: mq.height * .28,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image:  NetworkImage(widget.data[index].yoastHeadJson!.ogImage![0].url.toString()),
                      fit: BoxFit.fill)),
            ),
            userIcon: AppIcons.user,
            calenderIcon: AppIcons.calendar,
            tagIcon: AppIcons.tag,
          ),
        );
      }),
    );
  }
}
