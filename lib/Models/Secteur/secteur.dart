class Secteur {
  int? id;
  final String nom;

  final bool etat;
  Secteur({this.id, required this.nom, required this.etat});
  factory Secteur.fromJson(Map<String, dynamic> json) => Secteur(
        id: json["id"],
        nom: json["nom"],
        etat: json["etat"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom": nom,
        "etat": etat,
      };
}
