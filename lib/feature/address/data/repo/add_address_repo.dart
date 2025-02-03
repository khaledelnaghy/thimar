import 'dart:developer';

import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/address/data/model/request/add_address_params.dart';
import 'package:Thimar/feature/address/data/model/response/add_address_response_model/add_address_response_model.dart';
import 'package:Thimar/feature/address/data/model/response/get_address/get_address_response_model/get_address_response_model.dart';
import 'package:Thimar/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AddAddressRepo {
  static Future<AddAddressResponseModel?> storeAddressRepo(
      AddAddressParams params) async {
    try {
      var response = await DioProvider.post(
          endPoint: "/client/addresses",
          data: params.toJson(),
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });

      if (response.statusCode == 201) {
        return AddAddressResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<GetAddressResponseModel?> getAddressDataRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: "/client/addresses",
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return GetAddressResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> deleteCartRepo(int id) async {
    try {
      var response = await DioProvider.delete(
          endPoint: '/client/addresses/$id',
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
      log(e.message.toString());
      log(e.response!.data['message']);
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
    }
    return false;
  }
}
