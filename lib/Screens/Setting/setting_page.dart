// ignore_for_file: deprecated_member_use

import 'package:credit/Data/dispo.dart';
import 'package:credit/Models/Agence/agence.dart';
import 'package:credit/Models/Agence/agence_data.dart';
import 'package:credit/Models/Garanties/garanties.dart';
import 'package:credit/Models/Garants/garants.dart';
import 'package:credit/Models/Produit/produit.dart';
import 'package:credit/Models/Profession/profession.dart';
import 'package:credit/Models/TypeGaranties/type_garanties.dart';
import 'package:credit/Services/garanties_services.dart';
import 'package:credit/Services/garants_services.dart';
import 'package:credit/Services/type_garanties_services.dart';

import 'package:flutter/services.dart';

import 'package:credit/Models/Role/role.dart';

import 'package:credit/Models/Secteur/secteur.dart';

import 'package:credit/Screens/Agence/liste_agence.dart';
import 'package:credit/Services/agence_services.dart';
import 'package:credit/Services/produit_services.dart';
import 'package:credit/Services/profession_services.dart';
import 'package:credit/Services/role_services.dart';
import 'package:credit/Services/secteur_services.dart';
import 'package:credit/Widget/drawer_menu_widget.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SettingPage extends StatefulWidget {
  final VoidCallback openDrawer;
  const SettingPage({Key? key, required this.openDrawer}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  _SettingPage createState() => _SettingPage(openDrawer: openDrawer);
}

class _SettingPage extends State<SettingPage> {
  final VoidCallback openDrawer;
  _SettingPage({Key? key, required this.openDrawer});
  List<TypeGaranties> types = [];
  List<TypeGaranties> results = [];
  Future? myFuture;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text('Paramètre'),
          leading: DrawerMenuWidget(
            onClicked: openDrawer,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 70, left: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const ListeAgence();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        "Liste d'Agence",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showMyDialogAgence(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Liste de Secteur d'Activité",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showMyDialogSecture(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Liste de Profession ",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showMyDialogProfession(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Liste de Rôle",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showMyDialogRole(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Liste de type Planification",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Liste de Type Garanties",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showMyDialogTypeGaranties(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Liste de Produit",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showMyDialogProduit(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Liste de Garants ",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showMyDialogGarants(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        shape: const StadiumBorder(),
                        side: const BorderSide(
                          width: 2,
                          color: Colors.orange,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Liste de Garanties ",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        _showMyDialogGaranties(context);
                      },
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: Colors.orange,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
    // ignore: dead_code
  }

  void MessageValider() => Fluttertoast.showToast(msg: "Succées", fontSize: 18);

  Future<void> _showMyDialogAgence(BuildContext context) async {
    String nom = "";
    String adresse = "";
    String code = "";
    String description = "";
    final nomText = TextEditingController();
    final adresseText = TextEditingController();
    final codeText = TextEditingController();
    final descriptionText = TextEditingController();
    String? errornom;
    String? errorcode;
    GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    Agence? agence;
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            'Ajouter Agence',
            style: TextStyle(color: Colors.orange),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Nom d'Agence",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Nom")],
                    ),
                    onChanged: (val) {
                      nom = val;
                    },
                    controller: nomText,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Adresse d'Agence",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Adresse")],
                    ),
                    onChanged: (val) {
                      adresse = val;
                    },
                    controller: adresseText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Code d'Agence",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errorcode,
                    ),
                    validator: MultiValidator(
                        [RequiredValidator(errorText: "remplir Code")]),
                    onChanged: (val) {
                      code = val;
                    },
                    controller: codeText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Description",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: MultiValidator(
                        [RequiredValidator(errorText: "remplir Description")]),
                    onChanged: (val) {
                      description = val;
                    },
                    controller: descriptionText,
                  )

                  // ignore: unnecessary_null_comparison
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Form(
              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () async {
                      AgenceServices.getAgenceByName(nom).then((value) {
                        setState(() {
                          if (value != null) {
                            agence = value;
                            print(agence?.nom);
                            errornom = "nom exsite";
                          } else {
                            errornom = null;

                            AgenceServices.getAgenceByCode(code).then((value) {
                              setState(() {
                                if (value != null) {
                                  agence = value;
                                  print(agence?.nom);
                                  errorcode = "code exsite";
                                } else {
                                  errorcode = null;

                                  // ignor e: unnecessary_null_comparison

                                  if (fromKey.currentState?.validate() ==
                                      true) {
                                    setState(() {
                                      final Agence agence = Agence(
                                          nom: nom,
                                          adresse: adresse,
                                          code: code,
                                          description: description,
                                          etat: true);
                                      Provider.of<AgenceData>(context,
                                              listen: false)
                                          .addAgence(agence);
                                      Navigator.of(context).pop();
                                      MessageValider();
                                    });
                                  }
                                }
                              });
                            });
                          }
                        });
                      });
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.check,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Text(
                          "Valider",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          "Annuler",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialogSecture(context) async {
    String nom = "";
    String? errornom;
    Secteur secteur;
    GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    final nomText = TextEditingController();

    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            "Ajouter Secteur d'Activité",
            style: TextStyle(color: Colors.orange),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Nom de Secteur",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Nom")],
                    ),
                    onChanged: (val) {
                      nom = val;
                    },
                    controller: nomText,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Form(
              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () async {
                      SecteurServices.getSecteurByName(nom).then((value) {
                        setState(() {
                          if (value != null) {
                            secteur = value;
                            print(secteur.nom);
                            errornom = "nom exsite";
                          } else {
                            errornom = null;
                            if (fromKey.currentState?.validate() == true) {
                              setState(() {
                                final Secteur secteur =
                                    Secteur(nom: nom, etat: true);

                                SecteurServices.addSecteur(
                                    secteur.nom, secteur.etat);
                                Navigator.of(context).pop();
                                MessageValider();
                              });
                            }
                          }
                        });
                      });
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.check,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Text(
                          "Valider",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          "Annuler",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialogTypeGaranties(context) async {
    String nom = "";
    String? errornom;
    TypeGaranties typeGaranties;
    GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    final nomText = TextEditingController();

    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            "Ajouter Type Garanties",
            style: TextStyle(color: Colors.orange),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Nom Type",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Nom")],
                    ),
                    onChanged: (val) {
                      nom = val;
                    },
                    controller: nomText,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Form(
              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () async {
                      TypeGarantiesServices.getTypeGarantiesByName(nom)
                          .then((value) {
                        setState(() {
                          if (value != null) {
                            typeGaranties = value;
                            print(typeGaranties.nom);
                            errornom = "nom exsite";
                          } else {
                            errornom = null;
                            if (fromKey.currentState?.validate() == true) {
                              setState(() {
                                final TypeGaranties type =
                                    TypeGaranties(nom: nom, etat: true);

                                TypeGarantiesServices.addTypeGaranties(
                                    type.nom, type.etat);
                                Navigator.of(context).pop();
                                MessageValider();
                              });
                            }
                          }
                        });
                      });
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.check,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Text(
                          "Valider",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          "Annuler",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  getTypeGaranties() async {
    TypeGarantiesServices.getTypeGarantiesByEtat(true).then((value) {
      setState(() {
        types.addAll(value);
        results = types;
        print(results);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTypeGaranties();
  }

  Future<void> _showMyDialogGaranties(context) async {
    String nom = "";
    double montant = 0;
    String? errornom;
    Garanties garanties;
    String? _type;

    GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    final nomText = TextEditingController();
    final montantText = TextEditingController();

    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            "Ajouter Garanties",
            style: TextStyle(color: Colors.orange),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Nom de Garanties",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Nom")],
                    ),
                    onChanged: (val) {
                      nom = val;
                    },
                    controller: nomText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Montant",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Montant")],
                    ),
                    controller: montantText,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButton<String>(
                    items: results.map((item) {
                      return DropdownMenuItem(
                        child: Text(item.nom),
                        value: item.nom.toString(),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        _type = newValue;
                      });
                      print(_type);
                    },
                    isExpanded: true,
                    hint: const Text(
                      "Choisir Type",
                      style: TextStyle(color: Colors.orange),
                    ),
                    value: _type,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Form(
              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () async {
                      GarantiesServices.getGarantiesByName(nom).then((value) {
                        setState(() {
                          if (value != null) {
                            garanties = value;

                            errornom = "nom exsite";
                          } else {
                            errornom = null;
                            if (fromKey.currentState?.validate() == true) {
                              setState(() {
                                print(_type);
                                TypeGarantiesServices.getTypeGarantiesByName(
                                        _type!)
                                    .then((value) {
                                  setState(() {
                                    final TypeGaranties? typeGaranties;
                                    typeGaranties = value!;

                                    print(typeGaranties.nom);
                                    final Garanties garanties = Garanties(
                                        nom: nom,
                                        montant: double.parse(montantText.text),
                                        typeGaranties: TypeGaranties(
                                            id: typeGaranties.id,
                                            nom: typeGaranties.nom,
                                            etat: typeGaranties.etat),
                                        etat: true);

                                    GarantiesServices.addGaranties(
                                        garanties.nom,
                                        garanties.montant,
                                        garanties.typeGaranties,
                                        true);
                                    Navigator.of(context).pop();
                                    MessageValider();
                                  });
                                });
                              });
                            }
                          }
                        });
                      });
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.check,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Text(
                          "Valider",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          "Annuler",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialogGarants(context) async {
    String nom = "";
    String relation = "";
    double montant = 0;
    String description = "";
    String? errornom;
    String? errorrelation;
    String? errormontant;
    Garants garants;
    GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    final nomText = TextEditingController();
    final montantText = TextEditingController();
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            "Ajouter Garants",
            style: TextStyle(color: Colors.orange),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Nom de Garants",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Nom")],
                    ),
                    onChanged: (val) {
                      nom = val;
                    },
                    controller: nomText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Relation",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errorrelation,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Relation")],
                    ),
                    onChanged: (val) {
                      relation = val;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Montant",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errormontant,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Montant")],
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    controller: montantText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Description",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Description")],
                    ),
                    onChanged: (val) {
                      description = val;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Form(
              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () async {
                      GarantsServices.getGarantsByName(nom).then((value) {
                        setState(() {
                          if (value != null) {
                            garants = value;
                            print(garants.nom);
                            errornom = "nom exsite";
                          } else {
                            errornom = null;
                            if (fromKey.currentState?.validate() == true) {
                              setState(() {
                                final Garants garants = Garants(
                                    nom: nom,
                                    relation: relation,
                                    montant: double.parse(montantText.text),
                                    description: description,
                                    etat: true);

                                GarantsServices.addGarants(
                                    garants.nom,
                                    garants.relation,
                                    garants.montant,
                                    garants.description,
                                    true);
                                Navigator.of(context).pop();
                                MessageValider();
                              });
                            }
                          }
                        });
                      });
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.check,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Text(
                          "Valider",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          "Annuler",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialogProfession(context) async {
    String nom = "";
    String? errornom;
    Profession profession;

    GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    final nomText = TextEditingController();

    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            "Ajouter profession",
            style: TextStyle(color: Colors.orange),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Nom de Profession",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Nom")],
                    ),
                    onChanged: (val) {
                      nom = val;
                    },
                    controller: nomText,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Form(
              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () async {
                      ProfessionServices.getProfessionByName(nom).then((value) {
                        setState(() {
                          if (value != null) {
                            profession = value;
                            print(profession.nom);
                            errornom = "nom exsite";
                          } else {
                            errornom = null;
                            if (fromKey.currentState?.validate() == true) {
                              setState(() {
                                final Profession profession =
                                    Profession(nom: nom, etat: true);

                                ProfessionServices.addProfession(
                                    profession.nom, profession.etat);
                                Navigator.of(context).pop();
                                MessageValider();
                              });
                            }
                          }
                        });
                      });
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.check,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Text(
                          "Valider",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          "Annuler",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialogRole(context) async {
    String nom = "";
    String? errornom;
    Role role;
    GlobalKey<FormState> fromKey = GlobalKey<FormState>();

    final nomText = TextEditingController();

    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            "Ajouter Role",
            style: TextStyle(color: Colors.orange),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Nom de Role",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Nom")],
                    ),
                    onChanged: (val) {
                      nom = val;
                    },
                    controller: nomText,
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Form(
              child: Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () async {
                      RoleServices.getRoleByName(nom).then((value) {
                        setState(() {
                          if (value != null) {
                            role = value;
                            print(role.nom);
                            errornom = "nom exsite";
                          } else {
                            errornom = null;
                            if (fromKey.currentState?.validate() == true) {
                              setState(() {
                                final Role role = Role(nom: nom, etat: true);

                                RoleServices.addRole(role.nom, role.etat);
                                Navigator.of(context).pop();
                                MessageValider();
                              });
                            }
                          }
                        });
                      });
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.check,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Text(
                          "Valider",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: const <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          "Annuler",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialogProduit(context) async {
    Dispo? _dispo;
    String dispo = "";
    String nom = "";

    final dispoText = TextEditingController();
    final nomText = TextEditingController();
    final tauxText = TextEditingController();
    final montantText = TextEditingController();
    final echancieText = TextEditingController();
    final periodeText = TextEditingController();
    String? errornom;
    String? errordispo;
    GlobalKey<FormState> fromKey = GlobalKey<FormState>();
    return await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text(
            "Ajouter Produit",
            style: TextStyle(color: Colors.orange),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: Form(
              key: fromKey,
              child: ListBody(
                children: <Widget>[
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Nom de Role",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      errorText: errornom,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Nom")],
                    ),
                    onChanged: (val) {
                      setState(() {
                        nom = val;
                      });
                    },
                    controller: nomText,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Pour:",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                      enabled: false,
                      errorText: errordispo,
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Pour")],
                    ),
                    controller: dispoText,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: Dispo.Entrprise,
                        groupValue: _dispo,
                        onChanged: (Dispo? value) {
                          setState(() {
                            _dispo = value;
                            dispo = 'Entreprise';
                            dispoText.text = 'Entreprise';
                          });
                        },
                        activeColor: Colors.orange,
                      ),
                      const Text(
                        "Entreprise",
                        style: TextStyle(fontSize: 15, color: Colors.orange),
                      ),
                      Radio(
                        value: Dispo.Personne,
                        groupValue: _dispo,
                        onChanged: (Dispo? value) {
                          setState(() {
                            _dispo = value;
                            dispo = 'Personne';
                            dispoText.text = 'Personne';
                          });
                        },
                        activeColor: Colors.orange,
                      ),
                      const Text(
                        "Personne",
                        style: TextStyle(fontSize: 15, color: Colors.orange),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Taux de Produit",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Taux")],
                    ),
                    controller: tauxText,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Montant de Produit",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Montant ")],
                    ),
                    controller: montantText,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Echéance",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Echéance ")],
                    ),
                    controller: echancieText,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Colors.transparent)),
                      hintText: "Periode de Grace ",
                      hintStyle: const TextStyle(color: Colors.orange),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                    validator: MultiValidator(
                      [RequiredValidator(errorText: "remplir Periode ")],
                    ),
                    controller: periodeText,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.orange,
                    ),
                  ),
                  onPressed: () {
                    ProduitServices.getProduitByName(nom).then((value) {
                      setState(() {
                        if (value != null) {
                          errornom = " nom exsite";
                        } else {
                          errornom = null;

                          errordispo = null;
                          if (fromKey.currentState?.validate() == true) {
                            setState(() {
                              final Produit produit = Produit(
                                  nom: nom,
                                  dispo: dispoText.text,
                                  taux: double.parse(tauxText.text),
                                  montant: double.parse(montantText.text),
                                  echancie: int.parse(echancieText.text),
                                  periodeGrace: int.parse(periodeText.text),
                                  etat: true);

                              ProduitServices.addProduit(
                                  produit.nom,
                                  produit.dispo,
                                  produit.taux,
                                  produit.montant,
                                  produit.echancie,
                                  produit.periodeGrace,
                                  true);
                              Navigator.of(context).pop();
                              MessageValider();
                            });
                          }
                        }
                      });
                    });
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.check,
                        color: Colors.orange,
                        size: 15,
                      ),
                      Text(
                        "Valider",
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 100,
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.orange,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(
                        Icons.cancel,
                        color: Colors.red,
                        size: 15,
                      ),
                      Text(
                        "Annuler",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
