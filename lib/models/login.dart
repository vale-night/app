class LoginResponse {
  String username;
  String expiresIn;
  String accessToken;

  LoginResponse(
      {required this.username,
      required this.expiresIn,
      required this.accessToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        username: json['username'],
        expiresIn: json['expiresIn'],
        accessToken: json['accessToken']);
  }
}
