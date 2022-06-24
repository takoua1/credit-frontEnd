import 'package:credit/Models/Garants/garants.dart';
import 'package:credit/Services/garants_services.dart';
import 'package:flutter/cupertino.dart';

class SecteurData extends ChangeNotifier {
  List<Garants> garants = [];

  void addGarants(Garants _garants) async {
    Garants? garants = await GarantsServices.addGarants(
        _garants.nom,
        _garants.relation,
        _garants.montant,
        _garants.description,
        _garants.etat);
    //agences.add(agence);
    notifyListeners();
  }

  void getGarantsbyName(String nom) async {
    GarantsServices.getGarantsByName(nom);
    notifyListeners();
  }

  void updateGarants(int id, Garants _garants) async {
    Garants? garants = await GarantsServices.updateGarants(
        id,
        _garants.nom,
        _garants.relation,
        _garants.montant,
        _garants.description,
        _garants.etat);
    notifyListeners();
  }
}
