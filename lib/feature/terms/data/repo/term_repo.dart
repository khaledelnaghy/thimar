import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/terms/data/model/response/term_response_model/term_response_model.dart';

class TermRepo {
  static Future<TermResponseModel?> termRepo() async {
    var response =
        await DioProvider.getData(endPoint: AppConstant.showTerms, header: {
      "Authorization":
          "Bearer ${LocalStorage.getData(key: LocalStorage.token)}",
    });

    if (response.statusCode == 200) {
      return TermResponseModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
