import 'dart:developer';

import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/feature/auth/data/models/request/login_params.dart';
import 'package:Thimar/feature/auth/data/models/request/register_params.dart';
import 'package:Thimar/feature/auth/data/models/response/register_response_model/register_response_model.dart';
import 'package:Thimar/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
  
class AuthRepo {
//register
  static Future<RegisterResponseModel?> registerRepo(
      RegisterParams params) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.register, data: params.toJson());
      print(response.data);

      if (response.statusCode == 200) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        return null;
      }
      
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  //login

  static Future<RegisterResponseModel?> loginRepo(LoginParams params) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.login, data: params.toJson());
      print(response.data);
      if (response.statusCode == 200) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> forgetPasswordRepo(String phone) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.forgotPassword, data: {"phone": phone});

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${e.response!.data['message']}'),
        ),
      );
    }
    return false;
  }

  static Future<RegisterResponseModel?> checkCodeRepo(
      String phone, String code, String phoneCode) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.checkCode,
          data: {"phone": phone, "code": code});
      if (response.statusCode == 200) {
        return RegisterResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: Text('${e.response!.data['message']}'),
        ),
      );
    }
    return null;
  }

  static Future<RegisterResponseModel?> verifiyCodoRepo(
      String phone, String code, String type, String deviceToken) async {
    try {
      print(
          "Request Data: { phone: $phone, code: $code, type: $type, device_token: $deviceToken }");
      var response = await DioProvider.post(endPoint: "/verify", data: {
        "phone": phone,
        "code": code,
        "type": type,
        "device_token": deviceToken
      });
      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        // print("Response Data: ${response.data}"); // طباعة البيانات المستلمة
        return RegisterResponseModel.fromJson(response.data);
      } else {
        if (response.data != null && response.data['message'] != null) {
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            SnackBar(content: Text(response.data['message'])),
          );
        } else {
          ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
              SnackBar(content: Text('حدث خطأ، يرجى المحاولة مرة أخرى.')));
        }
        // print("Error Response: ${response.data}"); // طباعة الخطأ
        // يمكنك استخدام رسالة الخطأ من الاستجابة

        return null;
      }
    } on DioException catch (e) {
      print("Dio Error: ${e.response?.data}");
      ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(SnackBar(
          content:
              Text('${e.response!.data['message'] ?? "حدث خطأ غير متوقع"}')));
    }
    return null;
  }
}

//Model => اللي شغال علية
// Params =>اللي يستخدمه واللي بيكون في body inside postman
