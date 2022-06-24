import 'package:credit/Models/Garanties/garanties.dart';
import 'package:credit/Services/garanties_services.dart';
import 'package:flutter/cupertino.dart';

class GarantiesData extends ChangeNotifier {
  List<Garanties> garanties = [];

  /* void addSecteur(Garanties _garanties) async {
    Garanties? garanties = await GarantiesServices.addGaranties(_garanties.nom,
        _garanties.montant, _garanties.typeGaranties, _garanties.etat);
    //agences.add(agence);
    notifyListeners();
  }*/

  void getGarantiesbyName(String nom) async {
    GarantiesServices.getGarantiesByName(nom);
    notifyListeners();
  }

  void updateGaranties(int id, Garanties _garanties) async {
    Garanties? garanties = await GarantiesServices.updateGaranties(
        id,
        _garanties.nom,
        _garanties.montant,
        _garanties.typeGaranties,
        _garanties.etat);
    notifyListeners();
  }
}
