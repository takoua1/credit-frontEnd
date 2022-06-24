import 'dart:convert';

import 'package:credit/Models/Profession/profession.dart';
import 'package:http/http.dart';
import 'globals.dart';

class ProfessionServices {
  static Future<Profession?> addProfession(String nom, bool etat) async {
    Map data = {
      "nom": nom,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/profession/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Profession.fromJson(json.decode(response.body));
    } else {
      //throw Exception('Failed to post cases');
      //throw ('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static getProfessionByName(String nom) async {
    var url = Uri.parse(baseURL + "/profession/getByName/profession?nom=$nom");

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return Profession(id: data["id"], nom: data["nom"], etat: data["etat"]);
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static getProfessionByEtat(bool etat) async {
    var url =
        Uri.parse(baseURL + "/profession/getProfessions/profession?etat=$etat");
    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        List<dynamic> data = jsonDecode(response.body);
        List<Profession> professions =
            data.map((dynamic item) => Profession.fromJson(item)).toList();

        return professions;
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Profession>> getProfessions(String query) async {
    var url = Uri.parse(baseURL + "/profession/getProfessions");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Profession> professions = data
          .map((dynamic item) => Profession.fromJson(item))
          .where((profession) {
        final nomLower = profession.nom.toLowerCase();

        final searchLower = query.toLowerCase();
        return nomLower.contains(searchLower);
      }).toList();

      return professions;
    } else {
      throw response.statusCode;
    }
  }

  static Future<Profession?> updateProfession(
      int? id, String nom, bool etat) async {
    Map data = {
      "nom": nom,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/profession/update/$id');
    final Response response = await put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      try {
        return Profession.fromJson(json.decode(response.body));
      } catch (e) {
        return null;
      }
    } else {
      throw Exception('Failed to update a profession');
    }
  }
}
