class RegisterParams {
  final String name;
  final int phone;
  final int password;
  final int confirmPassword;
  final String longtude;
  final String lattuide;
  RegisterParams(
      {required this.name,
      required this.phone,
      required this.password,
      required this.lattuide,
      required this.longtude,
      required this.confirmPassword});
  Map<String, dynamic> toJson() {
    return {
      "lat": lattuide,
      "lng": longtude,
      "fullname": name,
      "password": password,
      "phone": phone,
      "password_confirmation": confirmPassword
    };
  }
}
