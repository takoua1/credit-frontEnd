import 'package:credit/Models/Profession/profession.dart';
import 'package:credit/Services/profession_services.dart';
import 'package:flutter/cupertino.dart';

class ProfessionrData extends ChangeNotifier {
  List<Profession> profession = [];

  void addProfession(Profession _profession) async {
    Profession? profession = (await ProfessionServices.addProfession(
        _profession.nom, _profession.etat)) as Profession?;
    //agences.add(agence);
    notifyListeners();
  }

  void getProfessionbyName(String nom) async {
    ProfessionServices.getProfessionByName(nom);
    notifyListeners();
  }

  void updateProfession(int id, Profession _profession) async {
    Profession? profession = (await ProfessionServices.updateProfession(
        id, _profession.nom, _profession.etat)) as Profession?;
    notifyListeners();
  }
}
