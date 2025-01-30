import 'dart:developer';
import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/favourite/data/model/resposne/favorites_response_model/favorites_response_model.dart';

class FavoriteRepo {
  static Future<FavoritesResponseModel?> showFavoriteReoo() async {
    try {
      var resposne = await DioProvider.getData(
          endPoint: AppConstant.showFavorite,
          header: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}",
          });

      if (resposne.statusCode == 200) {
        return FavoritesResponseModel.fromJson(resposne.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }
}
