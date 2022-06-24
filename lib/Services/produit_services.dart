import 'dart:convert';
import 'dart:ffi';

import 'package:credit/Models/Produit/produit.dart';
import 'package:http/http.dart';
import 'globals.dart';

class ProduitServices {
  static Future<Produit?> addProduit(String nom, String dispo, double taux,
      double montant, int echancie, int periodeGrace, bool etat) async {
    Map data = {
      "nom": nom,
      "dispo": dispo,
      "taux": taux,
      "montant": montant,
      "echancie": echancie,
      "periodeGrace": periodeGrace,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/produit/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Produit.fromJson(json.decode(response.body));
    } else {
      //throw Exception('Failed to post cases');
      //throw ('Request failed with status: ${response.statusCode}.');
      return null;
    }
  }

  static getProduitByName(String nom) async {
    var url = Uri.parse(baseURL + "/produit/getByName/produit?nom=$nom");

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return Produit(
            id: data["id"],
            nom: data["nom"],
            dispo: data["dispo"],
            taux: data["taux"],
            montant: data["montant"],
            echancie: data["echancie"],
            periodeGrace: data["periodeGrace"],
            etat: data["etat"]);
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Produit>> getProduitByEtat(bool etat) async {
    var url = Uri.parse(baseURL + "/produit/getProduits/produit?etat=$etat");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Produit> produits =
          data.map((dynamic item) => Produit.fromJson(item)).toList();

      return produits;
    } else {
      throw response.statusCode;
    }
  }

  static Future<List<Produit>> getProduits(String query) async {
    var url = Uri.parse(baseURL + "/produit/getProduits");
    Response response = await get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Produit> produits =
          data.map((dynamic item) => Produit.fromJson(item)).where((produit) {
        final nomLower = produit.nom.toLowerCase();

        final searchLower = query.toLowerCase();
        return nomLower.contains(searchLower);
      }).toList();

      return produits;
    } else {
      throw response.statusCode;
    }
  }

  static Future<Produit?> updateProduit(int? id, String nom, String dispo,
      Float taux, int echancie, int periodeGrace, bool etat) async {
    Map data = {
      "nom": nom,
      "dispo": dispo,
      "taux": taux,
      "echancie": echancie,
      "periodeGrace": periodeGrace,
      "etat": etat,
    };

    var url = Uri.parse(baseURL + '/produit/update/$id');
    final Response response = await put(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      try {
        return Produit.fromJson(json.decode(response.body));
      } catch (e) {
        return null;
      }
    } else {
      throw Exception('Failed to update a Produit');
    }
  }
}
