import 'data.dart';

class TermResponseModel {
  Data? data;
  String? status;
  String? message;

  TermResponseModel({this.data, this.status, this.message});

  factory TermResponseModel.fromJson(Map<String, dynamic> json) {
    return TermResponseModel(
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
