import 'dart:convert';
import 'dart:ffi';

import 'package:credit/Models/Garants/garants.dart';
import 'package:http/http.dart';
import 'globals.dart';

class GarantsServices {
  static Future<Garants?> addGarants(String nom, String relation,
      double montant, String description, bool etat) async {
    Map data = {
      "nom": nom,
      "relation": relation,
      "montant": montant,
      "description": description,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/garants/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Garants.fromJson(json.decode(response.body));
    } else {
      //throw Exception('Failed to post cases');
      //throw ('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static getGarantsByName(String nom) async {
    var url = Uri.parse(baseURL + "/garants/getByName/garantsr?nom=$nom");

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        return Garants(
            id: data["id"],
            nom: data["nom"],
            relation: data["relation"],
            montant: data["montant"],
            description: data["description"],
            etat: data["etat"]);
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Garants>> getGarantsByEtat(bool etat) async {
    var url = Uri.parse(baseURL + "/garants/getSecteurs/garants?etat=$etat");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Garants> garants =
          data.map((dynamic item) => Garants.fromJson(item)).toList();

      return garants;
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Garants>> getGarants(String query) async {
    var url = Uri.parse(baseURL + "/garants/getGarants");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Garants> garants =
          data.map((dynamic item) => Garants.fromJson(item)).where((garant) {
        final nomLower = garant.nom.toLowerCase();

        final searchLower = query.toLowerCase();
        return nomLower.contains(searchLower);
      }).toList();

      return garants;
    } else {
      throw response.statusCode;
    }
  }

  static Future<Garants?> updateGarants(int? id, String nom, String relation,
      double montant, String description, bool etat) async {
    Map data = {
      "nom": nom,
      "relation": relation,
      "montant": montant,
      "description": description,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/garants/update/$id');
    final Response response = await put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      try {
        return Garants.fromJson(json.decode(response.body));
      } catch (e) {
        return null;
      }
    } else {
      throw Exception('Failed to update a garants');
    }
  }
}
