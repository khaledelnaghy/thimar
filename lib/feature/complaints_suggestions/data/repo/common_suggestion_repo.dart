import 'dart:developer';

import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/complaints_suggestions/data/model/request/common_suggestion_params.dart';
import 'package:Thimar/feature/complaints_suggestions/data/model/response/common_suggestion_response_model.dart';
import 'package:Thimar/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CommonSuggestionRepo {
  static Future<CommonSuggestionResponseModel?> commonSuggestionRepo(
      SuggestionsParams params) async {
    try {
      var response = await DioProvider.post(
        endPoint: AppConstant.suggestionsAndComplaints,
        data: params.toJson(),
        header: {
          'Authorization':
              'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
        },
      );
      if (response.statusCode == 200) {
        return CommonSuggestionResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.response!.data.toString());
      log(e.response!.data?['message'] ?? "");
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
          SnackBar(content: Text(e.response!.data?['message'] ?? "")));
    }
    return null;
  }
}
