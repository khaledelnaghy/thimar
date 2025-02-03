// import 'package:equatable/equatable.dart';
// import 'datum.dart';

// class ShowCartResponseModel extends Equatable {
//   final List<Datum>? data;
//   final double? totalPriceBeforeDiscount;
//   final double? totalDiscount;
//   final double? totalPriceWithVat;
//   final double? deliveryCost;
//   final double? freeDeliveryPrice;
//   final double? vat;
//   final bool? isVip;
//   final double? vipDiscountPercentage;
//   final double? minVipPrice;
//   final String? vipMessage;
//   final String? status;
//   final String? message;

//   const ShowCartResponseModel({
//     this.data,
//     this.totalPriceBeforeDiscount,
//     this.totalDiscount,
//     this.totalPriceWithVat,
//     this.deliveryCost,
//     this.freeDeliveryPrice,
//     this.vat,
//     this.isVip,
//     this.vipDiscountPercentage,
//     this.minVipPrice,
//     this.vipMessage,
//     this.status,
//     this.message,
//   });

//   factory ShowCartResponseModel.fromJson(Map<String, dynamic> json) {
//     return ShowCartResponseModel(
//       data: (json['data'] as List<dynamic>?)
//           ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
//           .toList(),
//       totalPriceBeforeDiscount: double.tryParse(json['total_price_before_discount']?.toString() ?? '0.0'),
//       totalDiscount: double.tryParse(json['total_discount']?.toString() ?? '0.0'),
//       totalPriceWithVat: double.tryParse(json['total_price_with_vat']?.toString() ?? '0.0'),
//       deliveryCost: double.tryParse(json['delivery_cost']?.toString() ?? '0.0'),
//       freeDeliveryPrice: double.tryParse(json['free_delivery_price']?.toString() ?? '0.0'),
//       vat: double.tryParse(json['vat']?.toString() ?? '0.0'),
//       isVip: json['is_vip'] as bool? ?? false,
//       vipDiscountPercentage: double.tryParse(json['vip_discount_percentage']?.toString() ?? '0.0'),
//       minVipPrice: double.tryParse(json['min_vip_price']?.toString() ?? '0.0'),
//       vipMessage: json['vip_message'] as String?,
//       status: json['status'] as String?,
//       message: json['message'] as String?,
//     );
//   }

//   Map<String, dynamic> toJson() => {
//     'data': data?.map((e) => e.toJson()).toList(),
//     'total_price_before_discount': totalPriceBeforeDiscount,
//     'total_discount': totalDiscount,
//     'total_price_with_vat': totalPriceWithVat,
//     'delivery_cost': deliveryCost,
//     'free_delivery_price': freeDeliveryPrice,
//     'vat': vat,
//     'is_vip': isVip,
//     'vip_discount_percentage': vipDiscountPercentage,
//     'min_vip_price': minVipPrice,
//     'vip_message': vipMessage,
//     'status': status,
//     'message': message,
//   };

//   @override
//   List<Object?> get props => [
//     data,
//     totalPriceBeforeDiscount,
//     totalDiscount,
//     totalPriceWithVat,
//     deliveryCost,
//     freeDeliveryPrice,
//     vat,
//     isVip,
//     vipDiscountPercentage,
//     minVipPrice,
//     vipMessage,
//     status,
//     message,
//   ];
// }
import 'package:equatable/equatable.dart';

import 'datum.dart';

class ShowCartResponseModel extends Equatable {
  final List<Datum>? data;
  final dynamic totalPriceBeforeDiscount;
  final dynamic totalDiscount;
  final dynamic totalPriceWithVat;
  final dynamic deliveryCost;
  final dynamic freeDeliveryPrice;
  final dynamic vat;
  final dynamic isVip;
  final dynamic vipDiscountPercentage;
  final dynamic minVipPrice;
  final String? vipMessage;
  final String? status;
  final String? message;

  const ShowCartResponseModel({
    this.data,
    this.totalPriceBeforeDiscount,
    this.totalDiscount,
    this.totalPriceWithVat,
    this.deliveryCost,
    this.freeDeliveryPrice,
    this.vat,
    this.isVip,
    this.vipDiscountPercentage,
    this.minVipPrice,
    this.vipMessage,
    this.status,
    this.message,
  });

  factory ShowCartResponseModel.fromJson(Map<String, dynamic> json) {
    return ShowCartResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPriceBeforeDiscount: json['total_price_before_discount'] as dynamic,
      totalDiscount: (json['total_discount'] as dynamic),
      totalPriceWithVat: json['total_price_with_vat'] as dynamic,
      deliveryCost: json['delivery_cost'] as dynamic,
      freeDeliveryPrice: json['free_delivery_price'] as dynamic,
      vat: (json['vat'] as dynamic),
      isVip: json['is_vip'] as dynamic,
      vipDiscountPercentage: json['vip_discount_percentage'] as dynamic,
      minVipPrice: json['min_vip_price'] as dynamic,
      vipMessage: json['vip_message'] as String?,
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'total_price_before_discount': totalPriceBeforeDiscount,
        'total_discount': totalDiscount,
        'total_price_with_vat': totalPriceWithVat,
        'delivery_cost': deliveryCost,
        'free_delivery_price': freeDeliveryPrice,
        'vat': vat,
        'is_vip': isVip,
        'vip_discount_percentage': vipDiscountPercentage,
        'min_vip_price': minVipPrice,
        'vip_message': vipMessage,
        'status': status,
        'message': message,
      };

  @override
  List<Object?> get props {
    return [
      data,
      totalPriceBeforeDiscount,
      totalDiscount,
      totalPriceWithVat,
      deliveryCost,
      freeDeliveryPrice,
      vat,
      isVip,
      vipDiscountPercentage,
      minVipPrice,
      vipMessage,
      status,
      message,
    ];
  }
}
