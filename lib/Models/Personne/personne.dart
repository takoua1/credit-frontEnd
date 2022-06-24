import 'package:credit/Models/Profession/profession.dart';
import 'package:credit/Models/Secteur/secteur.dart';
import 'package:credit/Models/User/user.dart';

class Personne {
  int? id;
  String adresse;
  String mail;
  int tel;
  int cin;
  String nom;
  String prenom;
  String sexe;
  String naissance;

  Profession profession;
  Secteur secteur;
  User user;
  bool etat;
  Personne(
      {this.id,
      required this.adresse,
      required this.mail,
      required this.tel,
      required this.cin,
      required this.nom,
      required this.prenom,
      required this.sexe,
      required this.naissance,
      required this.profession,
      required this.secteur,
      required this.user,
      required this.etat});

  factory Personne.fromJson(Map<String, dynamic> json) => Personne(
      id: json["id"],
      adresse: json["adresse"],
      mail: json["mail"],
      tel: int.parse(json["tel"]),
      cin: int.parse(json["cin"]),
      nom: json["nom"],
      prenom: json["prenom"],
      sexe: json["sexe"],
      naissance: json["naissance"],
      profession: Profession.fromJson(json["profession"]),
      secteur: Secteur.fromJson(json["secteur"]),
      // ignore: unnecessary_null_in_if_null_operators
      user: User.fromJson(json["user"]),
      etat: json["etat"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "adresse": adresse,
        "mail": mail,
        "tel": tel,
        "nom": nom,
        "prenom": prenom,
        "sexe": sexe,
        "naissance": naissance,
        "profession": profession,
        "secteur": secteur,
        "user": user,
        "etat": etat
      };
}
