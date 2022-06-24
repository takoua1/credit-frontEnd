import 'dart:convert';

import 'package:credit/Models/TypeGaranties/type_garanties.dart';
import 'package:http/http.dart';
import 'globals.dart';

class TypeGarantiesServices {
  static addTypeGaranties(String nom, bool etat) async {
    Map data = {
      "nom": nom,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/typeGaranties/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return TypeGaranties.fromJson(json.decode(response.body));
    } else {
      //throw Exception('Failed to post cases');
      //throw ('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static Future<TypeGaranties?> getTypeGarantiesByName(String nom) async {
    var url =
        Uri.parse(baseURL + "/typeGaranties/getByName/typeGaranties?nom=$nom");

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return TypeGaranties(
            id: data["id"], nom: data["nom"], etat: data["etat"]);
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static getTypeGarantiesByEtat(bool etat) async {
    var url = Uri.parse(
        baseURL + "/typeGaranties/getTypeGaranties/typeGaranties?etat=$etat");
    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        List<dynamic> data = jsonDecode(response.body);
        List<TypeGaranties> typeGaranties =
            data.map((dynamic item) => TypeGaranties.fromJson(item)).toList();

        return typeGaranties;
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<TypeGaranties>> getTypeGaranties(String query) async {
    var url = Uri.parse(baseURL + "/typeGaranties/getTypeGaranties");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<TypeGaranties> typeGaranties = data
          .map((dynamic item) => TypeGaranties.fromJson(item))
          .where((type) {
        final nomLower = type.nom.toLowerCase();

        final searchLower = query.toLowerCase();
        return nomLower.contains(searchLower);
      }).toList();

      return typeGaranties;
    } else {
      throw response.statusCode;
    }
  }

  static Future<TypeGaranties?> updateTypeGaranties(
      int? id, String nom, bool etat) async {
    Map data = {
      "nom": nom,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/typeGarantiesr/update/$id');
    final Response response = await put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      try {
        return TypeGaranties.fromJson(json.decode(response.body));
      } catch (e) {
        return null;
      }
    } else {
      throw Exception('Failed to update a typeGaranties');
    }
  }
}
