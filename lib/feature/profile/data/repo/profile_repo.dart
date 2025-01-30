import 'dart:developer';

import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/profile/data/model/response/profile_response_model/profile_response_model.dart';
import 'package:Thimar/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProfileRepo {
  static Future<ProfileResponseModel?> showProfileRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showProfile,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });

      if (response.statusCode == 200) {
        return ProfileResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> logOutRepo() async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.logout,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.response!.data?['message'] ?? "");
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(content: Text(e.response!.data?['message'] ?? "")));
    }
    return false;
  }
}
