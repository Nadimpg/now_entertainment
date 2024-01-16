import 'dart:convert';

import 'package:blog_app/core/global/api_url_container.dart';
import 'package:blog_app/view/screens/profile/about_us/about_us_model.dart';
import 'package:blog_app/view/screens/profile/privacy_policy/privacy_policy_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AboutUsController extends GetxController {
  List<AboutUsModel> about = [];
  bool isLoading = false;

  Future<void> getRequest() async {
    isLoading = true;
    update();

    try {
      http.Response response = await http.get(
        Uri.parse("${ApiUrlContainer.baseURL}${ApiUrlContainer.aboutUs}"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        print("privacy===========------->${data[0]}");

        // Use map method to convert each item in the list to HomeCategoryModel
        about = data.map((json) => AboutUsModel.fromJson(json)).toList();
        print("privacy=============${about[0].content?.rendered.toString()}");

        if(about != null){
          about.addAll(about.reversed);
          update();
        }
        else{}
      } else {
        // print("==================categories");
      }
    } catch (e) {
      print(e);
    }

    isLoading = false;
    update();
  }
  @override
  void onInit() {
    getRequest();
    super.onInit();
  }
}
