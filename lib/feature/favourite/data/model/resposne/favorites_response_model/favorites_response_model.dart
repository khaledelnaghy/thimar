import 'datum.dart';

class FavoritesResponseModel {
  List<Datum>? data;
  String? status;
  String? message;

  FavoritesResponseModel({this.data, this.status, this.message});

  factory FavoritesResponseModel.fromJson(Map<String, dynamic> json) {
    return FavoritesResponseModel(
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
