import 'package:credit/Models/TypeGaranties/type_garanties.dart';
import 'package:credit/Services/type_garanties_services.dart';
import 'package:flutter/cupertino.dart';

class TypeGarantiesData extends ChangeNotifier {
  List<TypeGaranties> typeGaranties = [];

  void addTypeGaranties(TypeGaranties _type) async {
    TypeGaranties? type =
        await TypeGarantiesServices.addTypeGaranties(_type.nom, _type.etat);
    //agences.add(agence);
    notifyListeners();
  }

  void getTypeGarantiesbyName(String nom) async {
    TypeGarantiesServices.getTypeGarantiesByName(nom);
    notifyListeners();
  }

  void updateTypeGaranties(int id, TypeGaranties _type) async {
    TypeGaranties? type = await TypeGarantiesServices.updateTypeGaranties(
        id, _type.nom, _type.etat);
    notifyListeners();
  }
}
