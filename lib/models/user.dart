import 'package:untitled/models/organizer.dart';

class User {
  String? id;
  String? email;
  String? password;

  String? passwordConfirmation;

  // Client client;

  Organizer? organizer;

  User.empty();
  User(
      {required this.email,
      required this.password,
      this.passwordConfirmation,
      this.organizer});

  User.fromJson(Map<String?, dynamic> json) {
    this.id = json['id'];
    this.email = json['email'];
    this.password = json['password'];
    this.passwordConfirmation = json['passwordConfirmation'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    if (this.id != null) json['id'] = this.id;
    json['email'] = this.email;
    json['password'] = this.password;
    json['passwordConfirmation'] = this.passwordConfirmation;
    return json;
  }
}
