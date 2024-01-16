import 'dart:convert';

import 'package:blog_app/core/global/api_url_container.dart';
import 'package:blog_app/view/screens/profile/terms_condition/terms_condition_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TermsConditionController extends GetxController{
  List<TermsConditionModel> terms = [];
  bool isLoading = false;

  Future<void> getTerms() async {
    isLoading = true;
    update();

    try {
      http.Response response = await http.get(
        Uri.parse("${ApiUrlContainer.baseURL}${ApiUrlContainer.termsCondition}"),
      );
      print("====================URL ${ApiUrlContainer.baseURL}${ApiUrlContainer.termsCondition}");
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print("terms===========------->${data[0]}");

        // Use map method to convert each item in the list to HomeCategoryModel
        terms = data.map((json) => TermsConditionModel.fromJson(json)).toList();
        print("terms=============${terms[0].content?.rendered.toString()}");
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
    getTerms();
    super.onInit();
  }
}