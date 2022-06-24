import 'dart:convert';

Agence agenceFromJson(String str) => Agence.fromJson(json.decode(str));
String agencelToJson(Agence data) => json.encode(data.toJson());

class Agence {
  int? id;
  final String nom;
  final String adresse;
  final String code;
  final String description;
  final bool etat;
  Agence(
      {this.id,
      required this.nom,
      required this.adresse,
      required this.code,
      required this.description,
      required this.etat});
  factory Agence.fromJson(Map<String, dynamic> json) => Agence(
        id: json["id"],
        nom: json["nom"],
        adresse: json["adresse"],
        code: json["code"],
        description: json["description"],
        etat: json["etat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "adresse": adresse,
        "code": code,
        "description": description,
        "etat": etat,
      };
}
