import 'dart:developer';
import 'package:Thimar/core/constant/apis.dart';
import 'package:Thimar/core/services/dio_provider.dart';
import 'package:Thimar/core/services/local_storage.dart';
import 'package:Thimar/feature/cart/data/models/resposne/show_cart_response_model.dart';
import 'package:Thimar/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CartRepo {
  //show cart
  static Future<ShowCartResponseModel?> showCartRepo() async {
    try {
      var response = await DioProvider.getData(
          endPoint: AppConstant.showCart,
          header: {
            'Authorization':
                'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
          });
      if (response.statusCode == 200) {
        return ShowCartResponseModel.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.message.toString());
      log(e.response!.data['message']);
      ScaffoldMessenger.of(navigatorKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
    }
    return null;
  }

  //store product in cart
  static Future<bool?> storeProductRepo(String id, String amount) async {
    try {
      var response = await DioProvider.post(
          endPoint: AppConstant.showCart,
          data: {
            "product_id": id,
            "amount": amount
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

  //delete from cart
  static Future<bool?> deleteCartRepo(int id) async {
    try {
      var response = await DioProvider.delete(
          endPoint: '/client/cart/delete_item/$id',
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

  //update cart product quantity

  static Future<bool?> updateCartRepo(
      {required int id, required String amount}) async {
    try {
      var response = await DioProvider.put(endPoint: '/client/cart/$id', data: {
        "amount": amount
      }, header: {
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
// import 'dart:developer';
// import 'package:Thimar/core/constant/apis.dart';
// import 'package:Thimar/core/services/dio_provider.dart';
// import 'package:Thimar/core/services/local_storage.dart';
// import 'package:Thimar/feature/cart/data/models/show_cart_response_model/show_cart_response_model.dart';
// import 'package:Thimar/main.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';

// class CartRepo {
//   //show cart
//   static Future<ShowCartResponseModel?> showCartRepo() async {
//     try {
//       var response = await DioProvider.getData(
//           endPoint: AppConstant.showCart,
//           header: {
//             "Authorization":
//                 "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
//           });

//       if (response.statusCode == 200) {
//         return ShowCartResponseModel.fromJson(response.data);
//       } else {
//         return null;
//       }
//     } on DioException catch (e) {
//       log(e.message.toString());
//       log(e.response!.data['message']);
//       ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
//         SnackBar(
//           content: Text(e.response!.data['message']),
//         ),
//       );
//     }
//     return null;
//   }

//   //store product in cart

//   static Future<bool?> storeCartRepo(String id, String amount) async {
//     try {
//       var response = await DioProvider.post(
//         endPoint: AppConstant.showCart,
//         header: {
//           "Authorization":
//               "Bearer ${LocalStorage.getData(key: LocalStorage.token)}"
//         },
//         data: {"product_id": id, "amount": amount},
//       );
//       if (response.statusCode == 201) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (e) {
//       log(e.message.toString());
//       log(e.response!.data['message']);
//       ScaffoldMessenger.of(navigatorKey.currentContext!)
//           .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
//     }
//     return false;
//   }

//   static Future<bool?> deleteCartRepo(int id) async {
//     try {
//       var response = await DioProvider.delete(
//           endPoint: '/client/cart/delete_item/$id',
//           header: {
//             'Authorization':
//                 'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
//           });
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (e) {
//       log(e.message.toString());
//       log(e.response!.data['message']);
//       ScaffoldMessenger.of(navigatorKey.currentContext!)
//           .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
//     }
//     return false;
//   }

//   static Future<bool?> updateCartRepo(
//       {required int id, required String amount}) async {
//     try {
//       var response = await DioProvider.put(endPoint: '/client/cart/$id', data: {
//         "amount": amount
//       }, header: {
//         'Authorization':
//             'Bearer ${LocalStorage.getData(key: LocalStorage.token)}'
//       });
//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (e) {
//       log(e.message.toString());
//       log(e.response!.data['message']);
//       ScaffoldMessenger.of(navigatorKey.currentContext!)
//           .showSnackBar(SnackBar(content: Text(e.response!.data['message'])));
//     }
//     return false;
//   }
// }

// //store Cart => 1- header: token , 2- data: product id , data amount (inside body in postman) + type Future<bool>.

// // delete Cart => 1- header: token , + type Future<bool>.

// //update Cart => 1- header: token , 2- data: product id , data amount (inside body in postman) + type Future<bool>.
