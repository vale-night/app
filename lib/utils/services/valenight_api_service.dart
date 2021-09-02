import 'dart:convert';

import 'package:untitled/constants/api_path.dart';

import 'package:http/http.dart' as http;

Future<bool> login(String userName, String password) async {
  const url = '$BASE_AUTH_URL/login';
  http.Response response = await http.post(Uri.parse(url),
      body: jsonEncode({userName: userName, password: password}));

  return true;
}

class LoginResponse {
  // String username;
  // int expiresIn;
  // String accessToken;
}
