import 'package:blog_app/view/screens/home/home/home_screen.dart';
import 'package:blog_app/view/screens/profile/about_us/about_us_screen.dart';
import 'package:blog_app/view/screens/profile/contact_us/contact_us_screen.dart';
import 'package:blog_app/view/screens/profile/edit_profile/edit_profile_screen.dart';
import 'package:blog_app/view/screens/profile/personal_information/personal_information_screen.dart';
import 'package:blog_app/view/screens/profile/privacy_policy/privacy_policy_screen.dart';
import 'package:blog_app/view/screens/profile/profile/profile_screen.dart';
import 'package:blog_app/view/screens/profile/terms_condition/terms_condition_screen.dart';
import 'package:blog_app/view/screens/read_more/read_more_screen.dart';
import 'package:blog_app/view/screens/search/search/search_screen.dart';
import 'package:blog_app/view/screens/splash/splash_screen.dart';
import 'package:blog_app/view/widgets/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:get/get.dart';

class AppRoutes{
  static String splashScreen = "/splash_screen";
  static String homeScreen = "/home_screen";
  static String  readMoreScreen= "/read_more_screen";
  static String  contactUsScreen= "/contact_us_screen";
  static String  aboutUsScreen= "/about_us_screen";
  static String  privacyPolicyScreen= "/privacy_policy_screen";
  static String  termsConditionsScreen= "/terms_condition_screen";
  static String  editProfileScreen= "/edit_profile_screen";
  static String  personalInformationScreen= "/personal_information_screen";
  static String  profileScreen= "/profile_screen";
  static String  navBar= "/bottom_nav_bar";

  static List<GetPage> routes =[
    GetPage(name: splashScreen, page: ()=> const SplashScreen()),

    GetPage(name: readMoreScreen, page: ()=>  const ReadMoreScreen()),
    GetPage(name: contactUsScreen, page: ()=>  const ContactUsScreen()),
    GetPage(name: aboutUsScreen, page: ()=>  const AboutUsScreen()),
    GetPage(name: privacyPolicyScreen, page: ()=>  PrivacyPolicyScreen()),
    GetPage(name: termsConditionsScreen, page: ()=> TermsConditionsScreen()),
    GetPage(name: editProfileScreen, page: ()=>  const EditProfileScreen()),
    GetPage(name: personalInformationScreen, page: ()=>  const PersonalInformationScreen()),
    GetPage(name: profileScreen, page: ()=>  const ProfileScreen()),
    GetPage(name: homeScreen, page: ()=>  const HomeScreen()),
  ];
}