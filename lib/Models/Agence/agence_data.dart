import 'package:credit/Models/Agence/agence.dart';
import 'package:credit/Services/agence_services.dart';
import 'package:flutter/cupertino.dart';

class AgenceData extends ChangeNotifier {
  List<Agence> agences = [];

  void addAgence(Agence _agence) async {
    Agence? agence = await AgenceServices.addAgence(_agence.nom,
        _agence.adresse, _agence.code, _agence.description, _agence.etat);
    //agences.add(agence);
    notifyListeners();
  }

  void getAgencebyName(String nom) async {
    AgenceServices.getAgenceByName(nom);
    notifyListeners();
  }

  void getAgencebyCode(String code) async {
    AgenceServices.getAgenceByCode(code);
    notifyListeners();
  }

  void getAgenceByEtat(bool etat) async {
    AgenceServices.getAgencesByEtat(etat);
    notifyListeners();
  }

  void updateAgence(int id, Agence _agence) async {
    Agence? agence = await AgenceServices.updateAgence(id, _agence.nom,
        _agence.adresse, _agence.code, _agence.description, _agence.etat);
    notifyListeners();
  }
}
