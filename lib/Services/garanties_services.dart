import 'dart:convert';
import 'dart:ffi';

import 'package:credit/Models/Garanties/garanties.dart';
import 'package:credit/Models/TypeGaranties/type_garanties.dart';
import 'package:http/http.dart';
import 'globals.dart';

class GarantiesServices {
  static Future<Garanties?> addGaranties(String nom, double montant,
      TypeGaranties typeGaranties, bool etat) async {
    Map data = {
      "nom": nom,
      "montant": montant,
      "typeGaranties": {
        "id": typeGaranties.id,
        "nom": typeGaranties.nom,
        "etat": typeGaranties.etat
      },
      "etat": etat,
    };
    print(data);
    var url = Uri.parse(baseURL + '/garanties/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Garanties.fromJson(json.decode(response.body));
    } else {
      //throw Exception('Failed to post cases');
      throw ('Request failed with status: ${response.statusCode}.');
      // return null;
    }
  }

  static getGarantiesByName(String nom) async {
    var url = Uri.parse(baseURL + "/garanties/getByName/garanties?nom=$nom");

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return Garanties(
            id: data["id"],
            nom: data["nom"],
            montant: data["montant"],
            typeGaranties: data["typeGaranties"],
            etat: data["etat"]);
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Garanties>> getGarantiesByEtat(bool etat) async {
    var url =
        Uri.parse(baseURL + "/garanties/getGaranties/garanties?etat=$etat");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Garanties> garanties =
          data.map((dynamic item) => Garanties.fromJson(item)).toList();

      return garanties;
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Garanties>> getGaranties(String query) async {
    var url = Uri.parse(baseURL + "/garanties/getGaranties");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Garanties> garanties = data
          .map((dynamic item) => Garanties.fromJson(item))
          .where((_garanties) {
        final nomLower = _garanties.nom.toLowerCase();

        final searchLower = query.toLowerCase();
        return nomLower.contains(searchLower);
      }).toList();

      return garanties;
    } else {
      throw response.statusCode;
    }
  }

  static Future<Garanties?> updateGaranties(int? id, String nom, double montant,
      TypeGaranties typeGaranties, bool etat) async {
    Map data = {
      "nom": nom,
      "montant": montant,
      "typeGaranties": typeGaranties,
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
        return Garanties.fromJson(json.decode(response.body));
      } catch (e) {
        return null;
      }
    } else {
      throw Exception('Failed to update a garanties');
    }
  }
}
