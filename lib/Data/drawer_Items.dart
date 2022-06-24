// ignore: file_names
import 'package:flutter/material.dart';
import 'package:credit/Models/drawer_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerIteams {
  // ignore: deprecated_member_use
  static const home = DrawerItem(title: 'Accueil', icon: FontAwesomeIcons.home);
  // ignore: deprecated_member_use
  static const profile =
      // ignore: deprecated_member_use
      DrawerItem(title: 'Profile', icon: FontAwesomeIcons.userAlt);

  static const notofication =
      DrawerItem(title: 'Profile', icon: Icons.notifications);
  static const histroique =
      DrawerItem(title: 'Historique', icon: Icons.history);
  static const setting = DrawerItem(title: 'Paramètre', icon: Icons.settings);
  static const logout = DrawerItem(title: 'Logout', icon: Icons.logout);
  static List<DrawerItem> all = [
    home,
    profile,
    histroique,
    notofication,
    setting,
    logout,
  ];
}
