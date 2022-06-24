import 'dart:ffi';

import 'package:credit/Models/TypeGaranties/type_garanties.dart';

class Garanties {
  int? id;
  final String nom;
  final double montant;
  final TypeGaranties typeGaranties;

  final bool etat;
  Garanties(
      {this.id,
      required this.nom,
      required this.montant,
      required this.typeGaranties,
      required this.etat});
  factory Garanties.fromJson(Map<String, dynamic> json) => Garanties(
        id: json["id"],
        nom: json["nom"],
        montant: double.parse(json["montant"]),
        typeGaranties: TypeGaranties.fromJson(json["typeGaranties"]),
        etat: json["etat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "montant": montant,
        "typeGaranties": {
          "id": typeGaranties.id,
          "nom": typeGaranties.nom,
          "etat": typeGaranties.etat
        },
        "etat": etat,
      };
}
