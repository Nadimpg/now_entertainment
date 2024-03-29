import 'dart:convert';
import 'dart:io';
import 'package:blog_app/core/global/api_response_model.dart';
import 'package:blog_app/core/helper/sharedpreference_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

import '../global/api_authorization_response_model.dart';
import '../global/api_response_method.dart';

class ApiService {
  SharedPreferences sharedPreferences;
  ApiService({required this.sharedPreferences});

  Future<ApiResponseModel> request(
      String uri, String method, Map<String, dynamic>? params,
      {bool passHeader = false, isRawData = false}) async {
    Uri url = Uri.parse(uri);
    http.Response response;

    try {
      if (method == ApiResponseMethod.postMethod) {
        if (passHeader) {
          initToken();
          response = await http.post(
            url,
            headers: {
              "Content-Type": "application/json",
              "Authorization": "$tokenType $token"
            },
            body: isRawData ? jsonEncode(params) : params,
          );
        } else {
          response = await http.post(url, body: params);
        }
      } else if (method == ApiResponseMethod.patchMethod) {
        if (passHeader) {
          initToken();
          response = await http.patch(
            url,
            headers: {
              "Content-Type": "application/json",
              "Authorization": "$tokenType $token"
            },
            body: isRawData ? jsonEncode(params) : params,
          );
        } else {
          response = await http.patch(url, body: params);
        }
      } else if (method == ApiResponseMethod.deleteMethod) {
        response = await http.delete(url);
      } else if (method == ApiResponseMethod.updateMethod) {
        response = await http.patch(url);
      } else {
        if (passHeader) {
          initToken();
          response = await http.get(url, headers: {
            "Content-Type": "application/json",
            "Authorization": "$tokenType $token"
          });
        } else {
          response = await http.get(url);
        }
      }

      if (kDebugMode) {
        print(url.toString());
        print(response.body);
      }

      ApiAuthorizationResponseModel authorizationResponseModel =
          ApiAuthorizationResponseModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 200) {
        try {
          if (authorizationResponseModel.message == 'Unauthenticated') {
            sharedPreferences.setBool(
                SharedPreferenceHelper.isRememberMe, false);
            sharedPreferences.remove(SharedPreferenceHelper.token);

            /*TostMessage.toastMessage(
                message: authorizationResponseModel.message.toString());
            Get.offAllNamed(AppRoute.signIn);*/
          }
        } catch (e) {
          e.toString();
        }

        return ApiResponseModel(response.statusCode,
            authorizationResponseModel.message.toString(), response.body);
      } else {
        return ApiResponseModel(response.statusCode,
            authorizationResponseModel.message.toString(), response.body);
      }
    } on SocketException {
      return ApiResponseModel(503, "No internet connection", '');
    } on FormatException {
      return ApiResponseModel(400, "Bad Response Request", '');
    }
  }

  String token = '';
  String tokenType = '';

  initToken() {
    if (sharedPreferences.containsKey(SharedPreferenceHelper.token)) {
      String? t = sharedPreferences.getString(SharedPreferenceHelper.token);
      String? tType =
          sharedPreferences.getString(SharedPreferenceHelper.accessTokenType);
      token = t ?? '';
      tokenType = tType ?? 'Bearer';
    } else {
      token = '';
      tokenType = 'Bearer';
    }
  }
}
