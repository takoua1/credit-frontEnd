class TypeGaranties {
  int? id;
  final String nom;

  final bool etat;
  TypeGaranties({this.id, required this.nom, required this.etat});
  factory TypeGaranties.fromJson(Map<String, dynamic> json) => TypeGaranties(
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
