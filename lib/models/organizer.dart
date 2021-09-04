import 'package:untitled/models/user.dart';

class Organizer {
  String? id;
  String? name;
  String? cpf;
  String? fantasyName;
  String? cnpj;
  String? socialReason;
  DateTime? birthDate;
  User user = User.empty();
  DateTime? createdAt;
  DateTime? updatedAt;

  Organizer.empty();

  Organizer(
      {this.id,
      required this.name,
      required this.cpf,
      required this.fantasyName,
      required this.cnpj,
      required this.socialReason,
      required this.user,
      required this.birthDate,
      this.createdAt,
      this.updatedAt});

  Organizer.fromJson(Map<String?, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.cpf = json['cpf'];
    this.fantasyName = json['fantasyName'];
    this.cnpj = json['cnpj'];
    this.socialReason = json['socialReason'];
    this.birthDate = json['birthDate'];
    if (json['user'] != null) this.user = User.fromJson(json['user']);
    this.createdAt = json['createdAt'];
    this.updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    if (this.id != null) json['id'] = this.id;
    json['name'] = this.name;
    json['cpf'] = this.cpf;
    json['fantasyName'] = this.fantasyName;
    json['cnpj'] = this.cnpj;
    json['birthDate'] = this.birthDate;
    json['socialReason'] = this.socialReason;
    json['user'] = this.user.toJson();
    json['createdAt'] = this.createdAt;
    json['updatedAt'] = this.updatedAt;
    return json;
  }
}
