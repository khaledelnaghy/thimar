import 'dart:developer';

import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class OrderRepo {
  static Future<bool?> confirmOrderRepo(
      {required String addressId,
      required String date,
      required String time,
      required String payType}) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.confirmOrder,
          data: {
            "address_id": addressId,
            "date": date,
            "time": time,
            "pay_type": payType
          },
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response!.data['message']);
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
    }
    return false;
  }
}
