import 'dart:convert';

import 'package:blog_app/core/global/api_url_container.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_category/home_category_model.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_category_post/home_category_post_controller.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_category_post/home_category_post_model.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_community/home_community_model.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_enterpreneur/home_enterpreneur_model.dart';
import 'package:blog_app/view/screens/home/home/inner_widgets/home_fashion/home_fashion_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeCategoryController extends GetxController {
  List<HomeCategoryModel> categories = [];

  RxList<HomeFashionModel> AllPost = <HomeFashionModel>[].obs;

  List<int> id = [];

  int selectedTabIndex = 0;

  bool isCategoryLoading = false;
  bool isPostLoading = false;

  Future<void> getCategory(String url) async {
    isCategoryLoading = true;
    update();

    try {
      http.Response response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        // Use map method to convert each item in the list to HomeCategoryModel
        categories =
            data.map((json) => HomeCategoryModel.fromJson(json)).toList();

        for (var category in categories) {
          id.add(category.id ?? 0);
        }

        print(id);
      } else {
        // Handle error cases here
      }
    } catch (e) {
      print(e);
    }

    isCategoryLoading = false;
    fastLoad();
    update();
  }


  // Future<void> getPost() async {
  //   isPostLoading = true;
  //   update();
  //
  //   try {
  //     http.Response response = await http.get(
  //      // Uri.parse("${ApiUrlContainer.baseURL}${ApiUrlContainer.homeCategoryPostStart}${id[selectedTabIndex]}${ApiUrlContainer.homeCategoryPostEnd}"),
  //       Uri.parse("${ApiUrlContainer.baseURL}posts?categories=${id[selectedTabIndex]}&orderby=date&page=$page&per_page=2"),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = jsonDecode(response.body);
  //
  //       print("===========------->${data[0]}");
  //       // Use map method to convert each item in the list to HomeCategoryModel
  //       AllPost.value = data.map((json) => HomeFashionModel.fromJson(json)).toList();
  //
  //       print("Done=============${AllPost[0].title?.rendered}");
  //       print("Done=============${AllPost[0].id}");
  //       var header=  response.headers;
  //       print("=====> header Get : ${header['x-wp-totalpages']}");
  //     update();
  //
  //     } else {
  //       print("==================categories")  ;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //
  //   isPostLoading = false;
  //   update();
  // }



  // @override
  // void onInit() {
  //
  //   // String url = "${ApiUrlContainer.baseURL}${ApiUrlContainer.homeCategory}";
  //   String url = "https://www.nowentertainment.net/wp-json/wp/v2/categories?page=1&per_page=25";
  //   getCategory(url);
  //   super.onInit();
  // }




  /// <----------------------------  Pagination blog post ---------------------->
  late ScrollController scrollController;
  int page = 1;
  var isFirstLoadRunning = false.obs;
  var hasNextPage = true.obs;
  var isLoadMoreRunning = false.obs;
  var perPage=10;


  // @override
  // void onInit() {
  //   fastLoad();
  //   scrollController = ScrollController();
  //   scrollController.addListener(() {
  //     if (scrollController.position.pixels ==
  //         scrollController.position.maxScrollExtent*300) {
  //       loadMore();
  //     }
  //   });
  //   String url = "https://www.nowentertainment.net/wp-json/wp/v2/categories?page=1&per_page=25";
  //   getCategory(url);
  //   super.onInit();
  // }

  refreshData()async{
    page=1;
    try {
      http.Response response = await http.get(
    //    Uri.parse("${ApiUrlContainer.baseURL}${ApiUrlContainer.homeCategoryPostStart}${id[selectedTabIndex]}${ApiUrlContainer.homeCategoryPostEnd}"),
        Uri.parse("${ApiUrlContainer.baseURL}posts?categories=${id[selectedTabIndex]}&orderby=date&page=$page&per_page=$perPage"),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        print("===========------->${data[0]}");
        // Use map method to convert each item in the list to HomeCategoryModel
        AllPost.value = data.map((json) => HomeFashionModel.fromJson(json)).toList();
        var header=  response.headers;
        totalPage=header['x-wp-totalpages'] as int;
        currentPage=1;
        print("Done=============${AllPost[0].title?.rendered}");
        print("Done=============${AllPost[0].id}");
        update();

      } else {
        print("==================categories")  ;
      }
    } catch (e) {
      print(e);
    }


  }

  var totalPage = (-1);
  var currentPage = (-1);

  fastLoad() async {
    page = 1;
    isFirstLoadRunning(true);
    try {
          http.Response response = await http.get(
            //    Uri.parse("${ApiUrlContainer.baseURL}${ApiUrlContainer.homeCategoryPostStart}${id[selectedTabIndex]}${ApiUrlContainer.homeCategoryPostEnd}"),
            Uri.parse("${ApiUrlContainer.baseURL}posts?categories=${id[selectedTabIndex]}&orderby=date&page=$page&per_page=$perPage"),
          );

          if (response.statusCode == 200) {
            final List<dynamic> data = jsonDecode(response.body);

            print("===========------->${data[0]}");
            // Use map method to convert each item in the list to HomeCategoryModel
            AllPost.value = data.map((json) => HomeFashionModel.fromJson(json)).toList();

            print("Done=============${AllPost[0].title?.rendered}");
            print("Done=============${AllPost[0].id}");
            update();
          var header=  response.headers;

          totalPage=int.parse(header['x-wp-totalpages']??"0");
          currentPage=1;
          print("=====> Total Page : ${header['x-wp-totalpages']}");
            isFirstLoadRunning(false);

          } else {
            print("==================categories")  ;
          }
        } catch (e) {
          print(e);
        }
        isFirstLoadRunning(false);
        update();
  }


  loadMore() async {
    print("load more");
    if (isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      update();
      page += 1;
      try {
        http.Response response = await http.get(
          //    Uri.parse("${ApiUrlContainer.baseURL}${ApiUrlContainer.homeCategoryPostStart}${id[selectedTabIndex]}${ApiUrlContainer.homeCategoryPostEnd}"),
          Uri.parse("${ApiUrlContainer.baseURL}posts?categories=${id[selectedTabIndex]}&orderby=date&page=$page&per_page=$perPage"),
        );

        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body);
          print("===========------->${data[0]}");
          // Use map method to convert each item in the list to HomeCategoryModel
          List<HomeFashionModel> demoList = data.map((json) => HomeFashionModel.fromJson(json)).toList();
          AllPost.value.addAll(demoList);
          isLoadMoreRunning(false);
          update();
          print("Done=============${AllPost[0].title?.rendered}");
          print("Done=============${AllPost[0].id}");
          update();
          var header=  response.headers;
          totalPage= int.parse(header['x-wp-totalpages']??"0");
          currentPage++;
          print("=====> Total Page : ${header['x-wp-totalpages'].runtimeType}");
        } else {
          print("==================categories")  ;
        }
      } catch (e) {
        print(e);
      }
      isLoadMoreRunning(false);
      update();
    }
  }





  @override
  void onClose() {
    scrollController.removeListener(loadMore);
    super.onClose();
  }
}
