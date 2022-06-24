class Profession {
  int? id;
  final String nom;

  final bool etat;
  Profession({this.id, required this.nom, required this.etat});
  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
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
