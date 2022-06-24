import 'dart:convert';

import 'package:credit/Models/Personne/personne.dart';
import 'package:credit/Models/Profession/profession.dart';
import 'package:credit/Models/Secteur/secteur.dart';
import 'package:credit/Models/User/user.dart';
import 'package:http/http.dart';
import 'globals.dart';

class PersonneServices {
  static Future<Personne> addPersonne(
      String nom,
      String prenom,
      String sexe,
      String naissance,
      String adresse,
      String mail,
      int tel,
      int cin,
      Profession profession,
      Secteur secteur,
      User user,
      bool etat) async {
    Map data = {
      "adresse": adresse,
      "mail": mail,
      "tel": tel,
      "cin": cin,
      "nom": nom,
      "prenom": prenom,
      "sexe": sexe,
      "naissance": naissance,
      "profession": profession,
      "secteur": secteur,
      "user": user,
      "etat": etat
    };
    var url = Uri.parse(baseURL + '/personne/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Personne.fromJson(json.decode(response.body));
    } else {
      //return null;
      throw response.statusCode;
    }
  }
}
