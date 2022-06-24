import 'dart:convert';

import 'package:credit/Models/Agence/agence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'globals.dart';
import 'package:http/http.dart';

class AgenceServices {
  static get http => null;

  static Future<Agence?> addAgence(String nom, String adresse, String code,
      String description, bool etat) async {
    Map data = {
      "nom": nom,
      "adresse": adresse,
      "code": code,
      "description": description,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/agence/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Agence.fromJson(json.decode(response.body));
    } else {
      //throw Exception('Failed to post cases');
      //throw ('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static Future<Agence?> getAgenceByName(String nom) async {
    var url = Uri.parse(baseURL + "/agence/getByName/agence?nom=$nom");
    Agence? _agence;

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return Agence(
            id: data["id"],
            nom: data["nom"],
            adresse: data["adresse"],
            code: data["code"],
            description: data["description"],
            etat: data["etat"]);
      } catch (e) {
        //print(_agence);
        return _agence;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<Agence?> getAgenceByCode(String code) async {
    var url = Uri.parse(baseURL + "/agence/getByCode/agence?code=$code");
    Agence? _agence;

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return Agence(
            id: data["id"],
            nom: data["nom"],
            adresse: data["adresse"],
            code: data["code"],
            description: data["description"],
            etat: data["etat"]);
      } catch (e) {
        // print(_agence);
        return _agence;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Agence>?> getAgencesByEtat(bool etat) async {
    var url = Uri.parse(baseURL + "/agence/getAgences/agence?etat=$etat");
    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        List data = jsonDecode(response.body);
        List<Agence> agences =
            data.map((dynamic item) => Agence.fromJson(item)).toList();
        //print(agences);
        return agences;
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Agence>> getAgences(String query) async {
    var url = Uri.parse(baseURL + "/agence/getAgences");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Agence> agences =
          data.map((dynamic item) => Agence.fromJson(item)).where((agence) {
        final nomLower = agence.nom.toLowerCase();
        final adresseLower = agence.adresse.toLowerCase();
        final searchLower = query.toLowerCase();
        return nomLower.contains(searchLower) ||
            adresseLower.contains(searchLower);
      }).toList();

      return agences;
    } else {
      throw response.statusCode;
    }
  }

  static Future<Agence?> updateAgence(int? id, String nom, String adresse,
      String code, String description, bool etat) async {
    Map data = {
      "nom": nom,
      "adresse": adresse,
      "code": code,
      "description": description,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/agence/update/$id');
    final Response response = await put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      try {
        return Agence.fromJson(json.decode(response.body));
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }
}
