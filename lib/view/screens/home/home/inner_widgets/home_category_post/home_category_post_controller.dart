/*import 'dart:convert';

import 'package:blog_app/core/global/api_url_container.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_category/home_category_controller.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_category_post/home_category_post_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeCategoryPostController extends GetxController{
  List<HomeCategoryPostModel> AllPost = [];
  HomeCategoryController homeCategoryController=Get.find<HomeCategoryController>();


  int selectedTabIndex = 0;

  bool isLoading = false;

  Future<void> getPost() async {
    isLoading = true;
    update();

    try {
      http.Response response = await http.get(
        Uri.parse("${ApiUrlContainer.baseURL}${ApiUrlContainer.homeCategoryPostStart}${homeCategoryController.id[homeCategoryController.selectedTabIndex]}${ApiUrlContainer.homeCategoryPostEnd}"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        print("===========------->${data[0]}");

        // Use map method to convert each item in the list to HomeCategoryModel
        AllPost =
            data.map((json) => HomeCategoryPostModel.fromJson(json)).toList();

        print("Done=============${AllPost[0].title?.rendered}");
        print("Done=============${AllPost[0].id}");


      } else {
        print("==================categories");
      }
    } catch (e) {
      print(e);
    }

    isLoading = false;
    update();
  }

  @override
  void onInit() {

    getPost();
    super.onInit();
  }
}*/
