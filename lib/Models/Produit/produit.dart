import 'dart:ffi';

class Produit {
  int? id;
  final String nom;
  final String dispo;
  final double taux;
  final double montant;
  final int echancie;
  final int periodeGrace;
  final bool etat;
  Produit(
      {this.id,
      required this.nom,
      required this.dispo,
      required this.taux,
      required this.montant,
      required this.echancie,
      required this.periodeGrace,
      required this.etat});
  factory Produit.fromJson(Map<String, dynamic> json) => Produit(
        id: json["id"],
        nom: json["nom"],
        dispo: json["dispo"],
        taux: double.parse(json["taux"]),
        montant: double.parse(json["montant"]),
        echancie: int.parse(json["echancie"]),
        periodeGrace: int.parse(json["periodeGrace"]),
        etat: json["etat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "dispo": dispo,
        "taux": taux,
        "montant": montant,
        "echancie": echancie,
        "periodeGrace": periodeGrace,
        "etat": etat,
      };
}
