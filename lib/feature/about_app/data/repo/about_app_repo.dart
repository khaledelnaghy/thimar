import 'dart:developer';

import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/about_app/data/model/response/about_app_response_model/about_app_response_model.dart';

class AboutAppRepo {
  static Future<AboutAppResponseModel?> aboutAppRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.showAbout, header: {
        "Authorization":
            "Bearer ${LocalStorage.getData(key: LocalStorage.token)}",
      });

      if (response.statusCode == 200) {
        return AboutAppResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
