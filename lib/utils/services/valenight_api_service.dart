import 'dart:convert';
import 'package:untitled/constants/api_path.dart';

import 'package:http/http.dart' as http;
import 'package:untitled/utils/services/local_storage_service.dart';

class ValeNightApiService {
  static Future<bool> login(String userName, String password) async {
    const url = '$BASE_AUTH_URL/login';
    http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'username': userName, 'password': password}));
    if (response.statusCode == 201) {
      var loginData = LoginResponse.fromJson(jsonDecode(response.body));
      //Por enquanto utilizaremos o localStorage, no futuro podemos passar para outro armazenamento (secure e shared deram pau)
      LocalStorageService().write('accessToken', loginData.accessToken);
      return true;
    }
    return false;
  }
}

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
