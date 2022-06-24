import 'package:flutter/material.dart';

class Garants {
  int? id;
  final String nom;
  final String relation;
  final double montant;
  final String description;
  final bool etat;
  Garants(
      {this.id,
      required this.nom,
      required this.relation,
      required this.montant,
      required this.description,
      required this.etat});
  factory Garants.fromJson(Map<String, dynamic> json) => Garants(
        id: json["id"],
        nom: json["nom"],
        relation: json["relation"],
        montant: double.parse(json["montant"]),
        description: json["description"],
        etat: json["etat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "relation": relation,
        "montant": montant,
        "description": description,
        "etat": etat,
      };
}
