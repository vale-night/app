import 'dart:convert';
import 'package:untitled/constants/api_path.dart';

import 'package:http/http.dart' as http;
import 'package:untitled/models/organizer.dart';

class ValeNightOrganizerService {
  static Future<Organizer?> save(Organizer organizer) async {
    const url = '$BASE_ORGANIZER_URL/';
    http.Response response = await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(organizer.toJson()));
    print(response.statusCode);
    if (response.statusCode == 201) {
      print(json.decode(response.body));
      var savedOrganizer = Organizer.fromJson(jsonDecode(response.body));
      print(json.encode(savedOrganizer.toJson()));
      return savedOrganizer;
    }
    return null;
  }
}
