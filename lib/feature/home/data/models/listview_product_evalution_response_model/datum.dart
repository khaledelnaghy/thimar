class Datum {
  int? value;
  String? comment;
  String? clientName;
  String? clientImage;

  Datum({this.value, this.comment, this.clientName, this.clientImage});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        value: json['value'] as int?,
        comment: json['comment'] as String?,
        clientName: json['client_name'] as String?,
        clientImage: json['client_image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'value': value,
        'comment': comment,
        'client_name': clientName,
        'client_image': clientImage,
      };
}
