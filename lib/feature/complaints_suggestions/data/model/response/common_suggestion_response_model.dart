class CommonSuggestionResponseModel {
  String? status;
  dynamic data;
  String? message;

  CommonSuggestionResponseModel({this.status, this.data, this.message});

  factory CommonSuggestionResponseModel.fromJson(Map<String, dynamic> json) {
    return CommonSuggestionResponseModel(
      status: json['status'] as String?,
      data: json['data'] as dynamic,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data,
        'message': message,
      };
}
