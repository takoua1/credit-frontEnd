import 'package:credit/Models/Personne/personne.dart';
import 'package:credit/Models/Role/role.dart';

import 'package:flutter/cupertino.dart';

class User {
  int? id;
  final String login;
  final String password;
  final List<Role> roles;

  final bool etat;

  User({
    this.id,
    required this.login,
    required this.password,
    required this.roles,
    required this.etat,
  });
  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      login: json["login"],
      password: json["password"],
      roles: (json["roles"] as List).map((e) => Role.fromJson(e)).toList(),
      etat: json["etat"]);
  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "password": password,
        "roles": roles == List<Role>.from(roles.map((x) => x.toJson())),
        "etat": etat,
      };
}
