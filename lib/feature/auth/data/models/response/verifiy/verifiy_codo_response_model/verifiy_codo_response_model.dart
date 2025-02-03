import 'data.dart';

class VerifiyCodoResponseModel {
  Data? data;
  String? status;
  String? message;

  VerifiyCodoResponseModel({this.data, this.status, this.message});

  factory VerifiyCodoResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifiyCodoResponseModel(
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
