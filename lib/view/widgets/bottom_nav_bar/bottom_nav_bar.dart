
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/utils/app_strings.dart';
import 'package:blog_app/view/screens/home/home/home_screen.dart';
import 'package:blog_app/view/screens/profile/profile/profile_screen.dart';
import 'package:blog_app/view/screens/search/search/search_screen.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex, super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var bottomNavIndex = 0;

  List<String> selectedIcon = [
    AppIcons.homeOutline,
    AppIcons.search,
    AppIcons.settingsOutline,
  ];

  List<String> selectedText = [
    AppStrings.home,
    AppStrings.search,
    "Settings",
  ];

  List<String> unselectedIcon = [
    AppIcons.home,
    AppIcons.search,
    AppIcons.settings ,
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: MediaQuery.of(context).size.width,
 padding:
      const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 14),
      alignment: Alignment.center,
      color: AppColors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          unselectedIcon.length,
              (index) => InkWell(
            onTap: () => onTap(index),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                index != bottomNavIndex
                    ? SvgPicture.asset(selectedIcon[index],color: AppColors.red_500,
                    height: 24, width: 24)
                    : SvgPicture.asset(unselectedIcon[index],color: AppColors.red_500,
                    height: 24, width: 24),
               const SizedBox(height: 4,),
                CustomText(
                  color: index == bottomNavIndex
                      ? AppColors.black_400
                      : AppColors.white.withOpacity(.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  text: selectedText[index],
                ),
                index == bottomNavIndex
                    ? Container(
                  width: 8,
                  height: 8,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    // HomeController homeController = Get.find<HomeController>();
    // homeController.scrollController.dispose();
    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        Get.offAll(() => const HomeScreen(),transition: Transition.noTransition);
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.offAll(() => const SearchScreen(),transition: Transition.noTransition);
      }
    }  else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.offAll(() => const ProfileScreen(),transition: Transition.noTransition);
      }
    }
  }
}

/*
import 'package:blog_app/utils/app_colors.dart';
import 'package:blog_app/utils/app_icons.dart';
import 'package:blog_app/view/widgets/text/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({required this.currentIndex, super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var bottomNavIndex = 0;

  List<String> selectedIcon = [
    AppIcons.homeOutline,
    AppIcons.search,
    AppIcons.settingsOutline,
  ];

  List<String> selectedText = ['Home', 'Category', 'Friends', 'Profile'];

  List<String> unselectedIcon = [
    AppIcons.home,
    AppIcons.search,
    AppIcons.settings ,
  ];

  @override
  void initState() {
    bottomNavIndex = widget.currentIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      padding:
      const EdgeInsetsDirectional.symmetric(horizontal: 24, vertical: 20),
      alignment: Alignment.center,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          unselectedIcon.length,
              (index) => InkWell(
            onTap: () => onTap(index),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                index != bottomNavIndex
                    ? SvgPicture.asset(selectedIcon[index],
                    color: AppColors.red_500, height: 24.h, width: 24.w)
                    : SvgPicture.asset(unselectedIcon[index],
                    color: AppColors.red_500, height: 24.h, width: 24.w),
                const SizedBox(
                  height: 4,
                ),
                CustomText(
                  color: index == bottomNavIndex
                      ? AppColors.black_500
                      : AppColors.black_500,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  text: selectedText[index],
                ),
                index == bottomNavIndex
                    ? Container(
                  width: 8.w,
                  height: 8.h,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    // HomeController homeController = Get.find<HomeController>();
    // homeController.scrollController.dispose();
    if (index == 0) {
      if (!(widget.currentIndex == 0)) {
        Get.offAll(() => const HomeScreen(),
            transition: Transition.noTransition);
      }
    } else if (index == 1) {
      if (!(widget.currentIndex == 1)) {
        Get.offAll(() => const CategoryScreen(),
            transition: Transition.noTransition);
      }
    } else if (index == 2) {
      if (!(widget.currentIndex == 2)) {
        Get.offAll(() => const FriendsScreen(),
            transition: Transition.noTransition);
      }
    }
  }
}*/
