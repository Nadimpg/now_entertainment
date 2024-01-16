

import 'package:blog_app/core/helper/no_internet.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_category/home_category_controller.dart';
import 'package:blog_app/view/screens/notifications/notification_controller.dart';
import 'package:blog_app/view/screens/profile/about_us/about_us_controller.dart';
import 'package:blog_app/view/screens/profile/edit_profile/edit_profile_controller.dart';
import 'package:blog_app/view/screens/profile/privacy_policy/privacy_policy_controller.dart';
import 'package:blog_app/view/screens/profile/terms_condition/terms_condition_controller.dart';
import 'package:blog_app/view/screens/search/search_controller/search_controller.dart';
import 'package:get/get.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeCategoryController(), fenix: true);
    // Get.lazyPut(() => HomeCategoryPostController(), fenix: true);
    Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => TermsConditionController(), fenix: true);
    Get.lazyPut(() => AboutUsController(), fenix: true);
    Get.lazyPut(() => SearchPostController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);

    Get.put(NoInternetController(), permanent: true);
    Get.put(NotificationController(), permanent: true);
  }
}