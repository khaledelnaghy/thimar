class ProductAddress {
  int? id;
  String? type;
  double? lat; // تغيير من int? إلى double?
  double? lng;
  String? location;
  String? description;
  bool? isDefault;
  String? phone;

  ProductAddress({
    this.id,
    this.type,
    this.lat,
    this.lng,
    this.location,
    this.description,
    this.isDefault,
    this.phone,
  });

  factory ProductAddress.fromJson(Map<String, dynamic> json) => ProductAddress(
        id: json['id'] as int?,
        type: json['type'] as String?,
        lat: (json['lat'] as num?)?.toDouble(), // تحويل إلى double
        lng: (json['lng'] as num?)?.toDouble(),
        location: json['location'] as String?,
        description: json['description'] as String?,
        isDefault: json['is_default'] as bool?,
        phone: json['phone'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'type': type,
        'lat': lat,
        'lng': lng,
        'location': location,
        'description': description,
        'is_default': isDefault,
        'phone': phone,
      };
}
