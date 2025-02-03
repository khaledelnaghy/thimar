class AddAddressParams {
  final String description;
  final String location;
  final String phone;
  final dynamic langitude;
  final dynamic latitude;
  final String type;
  final String isdefault;
  AddAddressParams({
    required this.type,
    required this.phone,
    required this.description,
    required this.location,
    required this.langitude,
    required this.latitude,
    required this.isdefault,
  });
  Map<String, dynamic> toJson() {
    return {
      "phone": phone,
      "description": description,
      "type": type,
      "location": location,
      "lng": langitude,
      "lat": latitude,
      "is_default": isdefault
    };
  }
}
