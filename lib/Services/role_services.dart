import 'dart:convert';

import 'package:credit/Models/Role/role.dart';
import 'package:http/http.dart';
import 'globals.dart';

class RoleServices {
  static Future<Role?> addRole(String nom, bool etat) async {
    Map data = {
      "nom": nom,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/roles/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Role.fromJson(json.decode(response.body));
    } else {
      //throw Exception('Failed to post cases');
      //throw ('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static getRoleByName(String nom) async {
    var url = Uri.parse(baseURL + "/roles/getByName/role?nom=$nom");

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return Role(id: data["id"], nom: data["nom"], etat: data["etat"]);
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Role>> getRoleByEtat(bool etat) async {
    var url = Uri.parse(baseURL + "/secteur/getSecteurs/secteur?etat=$etat");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Role> roles =
          data.map((dynamic item) => Role.fromJson(item)).toList();

      return roles;
    } else {
      throw response.statusCode;
    }
  }

  static Future<Role?> updateRole(int? id, String nom, bool etat) async {
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
        return Role.fromJson(json.decode(response.body));
      } catch (e) {
        return null;
      }
    } else {
      throw Exception('Failed to update a secteur');
    }
  }
}
