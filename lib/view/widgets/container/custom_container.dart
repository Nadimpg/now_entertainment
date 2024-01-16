import 'package:blog_app/main.dart';
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
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
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomContainer extends StatefulWidget {
  final bool isDetails;
  final bool isBookMarkImage;
  final bool isDetailsDescription;
  final String mediaText;
  final String mediaTitle;
  final String mediaPerson;
  final String date;
  final String mediaTag;
  final String mediaDescription;
  final String? detailsDescription;

  final String userIcon;
  final String calenderIcon;
  final String tagIcon;
  final VoidCallback? onTap;
  final Widget content;
  CustomContainer(
      {super.key,
      required this.mediaText,
      required this.mediaTitle,
      required this.mediaPerson,
      required this.date,
      required this.mediaTag,
      required this.mediaDescription,
      this.detailsDescription,
      this.onTap,

      required this.content,
      required this.userIcon,
      required this.calenderIcon,
      required this.tagIcon,
      this.isBookMarkImage = true,
      required this.isDetailsDescription,
      this.isDetails = false});

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isClicked = false;






  // List<String> paragraphs = [];
  //
  // @override
  // void initState() {
  // List<String> getFirstTwoParagraphs(String htmlContent) {
  //   List<String> result = [];
  //   var document = htmlParser.parse(htmlContent);
  //   var paragraphs = document.getElementsByTagName('p');
  //
  //   for (int i = 0; i < 2 && i < paragraphs.length; i++) {
  //     var paragraph = paragraphs[i];
  //     result.add(paragraph.outerHtml);
  //   }
  //
  //   return result;
  // }
  //
  // paragraphs =getFirstTwoParagraphs(widget.mediaDescription,);
  //
  //
  //   super.initState();
  // }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    var unescape = HtmlUnescape();
    var mediaTitle = unescape.convert( widget.mediaTitle);

    Widget discription =

    // Html(
    //
    //   shrinkWrap: true,
    //   data: widget.mediaDescription,
    //   onLinkTap:(url,attributes,element){
    //     debugPrint("==========> Lunch Url :   $url");
    //
    //     _launchUrl(url!);
    //   },
    //  style: {
    //    "img": Style(
    //      width:Width(60.w),
    //      height: Height(100.h)
    //    ),
    //  },
    //     extensions: const [
    //       TableHtmlExtension(),
    //       AudioHtmlExtension(),
    //       IframeHtmlExtension(),
    //       SvgHtmlExtension(),
    //       VideoHtmlExtension(
    //       ),
    //   ],
    //
    //          /* '''
    //     <video controls width="250">
    //       <source src="https://interactive-examples.mdn.mozilla.net/media/cc0-videos/flower.mp4" type="video/mp4">
    //       <code>VIDEO</code> support is not enabled.
    //     </video>''',*/
    // );
    HtmlWidget(
      widget.mediaDescription,
     buildAsync: true,
     enableCaching: true,
      // widget.mediaDescription.setJavaScriptEnabled(true);
      // onTapUrl: (url) => print('tapped $url')
    );

    mq = MediaQuery.of(context).size;

    /// Custom main container
    return Container(
      padding: widget.isDetails ? null : const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 16),
      width: mq.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: widget.isDetails
              ? null
              : Border.all(color: AppColors.red_500, width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// image or video
          widget.content,
          SizedBox(
            height: mq.height * .012,
          ),

          ///media name & bookMark
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
                color: AppColors.red_100,
                borderRadius: BorderRadius.circular(4)),
            child: CustomText(
               overflow: TextOverflow.visible,
              textAlign: TextAlign.start,
              maxLines: 2,
              text: widget.mediaText,
              color: AppColors.red_500,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: mq.height * .012,
          ),

          /// media title
          CustomText(
            textAlign: TextAlign.start,
            maxLines: 3,
            text:mediaTitle,
            color: AppColors.red_500,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
          SizedBox(
            height: mq.height * .008,
          ),

          ///person Name & dob
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomImage(
                      imageSrc: widget.userIcon,
                      size: 12,
                    ),
                    Flexible(
                      child: CustomText(
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        text: widget.mediaPerson,
                        color: AppColors.red_500,
                        fontSize: 12,
                        left: 4,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: mq.width * .02,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    CustomImage(
                      imageSrc: widget.calenderIcon,
                      size: 12,
                    ),
                    CustomText(
                      text: widget.date,
                      color: AppColors.red_500,
                      fontSize: 12,
                      left: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: mq.height * .008,
          ),

          /// tag
          Row(
            children: [
              CustomImage(
                imageSrc: widget.tagIcon,
                size: 12,
              ),
              Flexible(
                child: CustomText(
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  text: widget.mediaTag,
                  color: AppColors.black_400,
                  fontSize: 12,
                  left: 4,
                ),
              ),
            ],
          ),
          SizedBox(
            height: mq.height * .012,
          ),

          /// media description
          widget.isDetails == false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    discription,
                    SizedBox(
                      height: mq.height * .018,
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 4),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: AppColors.red_500))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (widget.isDetailsDescription)
                              CustomText(
                                text: widget.detailsDescription!,
                                color: AppColors.red_500,
                                fontSize: 18,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : discription
        ],
      ),
    );
  }
}
