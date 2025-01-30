import 'data.dart';

class PolicyResponseModel {
  Data? data;
  String? status;
  String? message;

  PolicyResponseModel({this.data, this.status, this.message});

  factory PolicyResponseModel.fromJson(Map<String, dynamic> json) {
    return PolicyResponseModel(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'status': status,
        'message': message,
      };
}
