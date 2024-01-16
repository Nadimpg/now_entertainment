import 'dart:convert';

import 'package:blog_app/core/global/api_url_container.dart';
import 'package:blog_app/view/screens/profile/privacy_policy/privacy_policy_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PrivacyPolicyController extends GetxController {
  List<PrivacyPolicyModel> privacy = [];
  bool isLoading = false;

  Future<void> getRequest() async {
    isLoading = true;
    update();

    try {
      http.Response response = await http.get(
        Uri.parse("${ApiUrlContainer.baseURL}${ApiUrlContainer.privacyPolicy}"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print("privacy===========------->${data[0]}");

        // Use map method to convert each item in the list to HomeCategoryModel
        privacy = data.map((json) => PrivacyPolicyModel.fromJson(json)).toList();
        print("privacy=============${privacy[0].content?.rendered.toString()}");
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
