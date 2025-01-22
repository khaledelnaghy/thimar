import 'dart:developer';
import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/home/data/models/banner_home_response_model/banner_home_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_drinks_response_model/category_drinks_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_fruties_response_model/category_fruties_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_home_response_model/category_home_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_meals_response_model/category_meals_response_model.dart';
import 'package:Thimar/feature/home/data/models/category_vegetables_response_model/category_vegetables_response_model.dart';
import 'package:Thimar/feature/home/data/models/home_response_model/home_response_model.dart';
import 'package:Thimar/feature/home/data/models/listview_product_evalution_response_model/listview_product_evalution_response_model.dart';

class HomeRepo {
  static Future<HomeResponseModel?> showHomeRepo() async {
    try {
      var resposne = await DioProvider.getData(endPoint: AppConstant.showHome);

      if (resposne.statusCode == 200) {
        return HomeResponseModel.fromJson(resposne.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<BannerHomeResponseModel?> bannerHomeRepo() async {
    try {
      var resposne =
          await DioProvider.getData(endPoint: AppConstant.bannerHome);

      if (resposne.statusCode == 200) {
        return BannerHomeResponseModel.fromJson(resposne.data);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoryHomeResponseModel?> categoriesHomeRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.categoriesHome);

      if (response.statusCode == 200) {
        return CategoryHomeResponseModel.fromJson(response.data);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoryDrinksResponseModel?> categoriesDrinkRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.categoriesDrinksHome);

      if (response.statusCode == 200) {
        return CategoryDrinksResponseModel.fromJson(response.data);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoryFrutiesResponseModel?> categoriesFrutiesRepo() async {
    try {
      var response =
          await DioProvider.getData(endPoint: AppConstant.categoriesFruitsHome);

      if (response.statusCode == 200) {
        return CategoryFrutiesResponseModel.fromJson(response.data);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoryVegetablesResponseModel?>
      categoryVegetablesRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.categoriesVegetablesHome);

      if (response.statusCode == 200) {
        return CategoryVegetablesResponseModel.fromJson(response.data);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<CategoryMealsResponseModel?> categoryMealRepo() async {
    try {
      var resposne =
          await DioProvider.getData(endPoint: AppConstant.categoriesMealsHome);

      if (resposne.statusCode == 200) {
        return CategoryMealsResponseModel.fromJson(resposne.data);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<ListviewProductEvalutionResponseModel?>
      listViewEvalutionRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.productEvaluationHome);

      if (response.statusCode == 200) {
        return ListviewProductEvalutionResponseModel.fromJson(response.data);
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
    }
    return null;
  }

  static Future<bool?> addToFavoriteRepo(int id) async {
    try {
      var response = await DioProvider.post(
          endPoint: "/client/products/$id/add_to_favorite",
          header: {
            "Authorization":
                "Bearer ${LocalStorage.getData(key: LocalStorage.token)}",
          });

      if (response.statusCode == 201) {
        return true;
      }
      return false;
    } on Exception catch (e) {
      log(e.toString());
    }
    return false;
  }
}

// HomeRepo => Model + method await DioProvider.getData
