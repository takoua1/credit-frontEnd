import 'dart:convert';

import 'package:credit/Models/Secteur/secteur.dart';
import 'package:http/http.dart';
import 'globals.dart';

class SecteurServices {
  static Future<Secteur?> addSecteur(String nom, bool etat) async {
    Map data = {
      "nom": nom,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/secteur/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Secteur.fromJson(json.decode(response.body));
    } else {
      //throw Exception('Failed to post cases');
      //throw ('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static getSecteurByName(String nom) async {
    var url = Uri.parse(baseURL + "/secteur/getByName/secteur?nom=$nom");

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return Secteur(id: data["id"], nom: data["nom"], etat: data["etat"]);
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static getSecteurByEtat(bool etat) async {
    var url = Uri.parse(baseURL + "/secteur/getSecteurs/secteur?etat=$etat");
    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        List<dynamic> data = jsonDecode(response.body);
        List<Secteur> secteurs =
            data.map((dynamic item) => Secteur.fromJson(item)).toList();

        return secteurs;
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Secteur>> getSecteurs(String query) async {
    var url = Uri.parse(baseURL + "/secteur/getSecteurs");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Secteur> secteurs =
          data.map((dynamic item) => Secteur.fromJson(item)).where((secteur) {
        final nomLower = secteur.nom.toLowerCase();

        final searchLower = query.toLowerCase();
        return nomLower.contains(searchLower);
      }).toList();

      return secteurs;
    } else {
      throw response.statusCode;
    }
  }

  static Future<Secteur?> updateSecteur(int? id, String nom, bool etat) async {
    Map data = {
      "nom": nom,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/secteur/update/$id');
    final Response response = await put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      try {
        return Secteur.fromJson(json.decode(response.body));
      } catch (e) {
        return null;
      }
    } else {
      throw Exception('Failed to update a secteur');
    }
  }
}
