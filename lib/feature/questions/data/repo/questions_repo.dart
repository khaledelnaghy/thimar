import 'dart:developer';

import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/questions/data/models/response/show_question_response_model/show_question_response_model.dart';

class QuestionsRepo {
  static Future<ShowQuestionResponseModel?> showQuestionRepo() async {
    try {
      var resposne = await DioProvider.getData(
          endPoint: AppConstant.showFaqs,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });

      if (resposne.statusCode == 200) {
        return ShowQuestionResponseModel.fromJson(resposne.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
