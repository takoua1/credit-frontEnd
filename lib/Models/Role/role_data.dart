import 'package:credit/Models/Role/role.dart';
import 'package:credit/Services/role_services.dart';
import 'package:flutter/cupertino.dart';

class RoleData extends ChangeNotifier {
  void addRole(Role _role) async {
    Role? role = await RoleServices.addRole(_role.nom, _role.etat);
    //agences.add(agence);
    notifyListeners();
  }

  void getRolebyName(String nom) async {
    RoleServices.getRoleByName(nom);
    notifyListeners();
  }
}
