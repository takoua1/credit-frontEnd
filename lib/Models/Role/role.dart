class Role {
  int? id;
  final String nom;

  final bool etat;
  Role({this.id, required this.nom, required this.etat});
  factory Role.fromJson(Map<String, dynamic> json) => Role(
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
