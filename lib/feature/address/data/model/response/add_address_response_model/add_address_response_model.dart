import 'data.dart';

class AddAddressResponseModel {
  String? status;
  String? message;
  ProductAddress? data;
  // List<Data>? data;

  AddAddressResponseModel({this.status, this.message, this.data});

  factory AddAddressResponseModel.fromJson(Map<String, dynamic> json) {
    return AddAddressResponseModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      // data: json['data'] == null
      //     ? null
      //     : (json['data'] as List<dynamic>)
      //         .map((item) => Data.fromJson(item as Map<String, dynamic>))
      //         .toList(), // تحويل القائمة إلى List<Data>
      data: json['data'] == null
          ? null
          : ProductAddress.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        // 'data': data?.map((item) => item.toJson()).toList(),
        'data': data?.toJson(),
      };
}
