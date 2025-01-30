import 'datum.dart';

class BannerHomeResponseModel {
  List<Datum>? data;
  String? status;
  String? message;

  BannerHomeResponseModel({this.data, this.status, this.message});

  factory BannerHomeResponseModel.fromJson(Map<String, dynamic> json) {
    return BannerHomeResponseModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'status': status,
        'message': message,
      };
}
