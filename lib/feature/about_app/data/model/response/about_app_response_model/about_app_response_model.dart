import 'data.dart';

class AboutAppResponseModel {
  Data? data;
  String? status;
  String? message;

  AboutAppResponseModel({this.data, this.status, this.message});

  factory AboutAppResponseModel.fromJson(Map<String, dynamic> json) {
    return AboutAppResponseModel(
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
