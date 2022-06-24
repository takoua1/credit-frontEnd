import 'package:credit/Models/Secteur/secteur.dart';
import 'package:credit/Services/secteur_services.dart';
import 'package:flutter/cupertino.dart';

class SecteurData extends ChangeNotifier {
  List<Secteur> secteurs = [];

  void addSecteur(Secteur _secteur) async {
    Secteur? secteur =
        await SecteurServices.addSecteur(_secteur.nom, _secteur.etat);
    //agences.add(agence);
    notifyListeners();
  }

  void getSecteurbyName(String nom) async {
    SecteurServices.getSecteurByName(nom);
    notifyListeners();
  }

  void updateSecteur(int id, Secteur _secteur) async {
    Secteur? secteur =
        await SecteurServices.updateSecteur(id, _secteur.nom, _secteur.etat);
    notifyListeners();
  }
}
