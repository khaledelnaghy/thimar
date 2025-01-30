import 'dart:developer';

import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/policy/data/model/response/policy_response_model/policy_response_model.dart';

class PolicyRepo {
  static Future<PolicyResponseModel?> showPolicyRepo() async {
    try {
      var resposne = await DioProvider.getData(
          endPoint: AppConstant.showPolicy,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (resposne.statusCode == 200) {
        return PolicyResponseModel.fromJson(resposne.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
