import 'package:blog_app/core/global/api_response_method.dart';
import 'package:blog_app/core/global/api_url_container.dart';
import 'package:blog_app/core/service/api_service.dart';

import '../../../../../../core/global/api_response_model.dart';

class HomeCategoryRepo{
  ApiService apiService;
  HomeCategoryRepo({required this.apiService});

  Future<ApiResponseModel> homeCategoryRepo()async{
    String url = "${ApiUrlContainer.baseURL}${ApiUrlContainer.homeCategory}";
    String responseMethod=ApiResponseMethod.getMethod;
    ApiResponseModel responseModel=await apiService.request(url, responseMethod,null, passHeader: false);

    return responseModel;
  }
}