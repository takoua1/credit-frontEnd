import 'dart:async';

import 'package:credit/Models/Agence/agence.dart';
import 'package:credit/Models/Agence/agence_data.dart';
import 'package:credit/Screens/Setting/setting_page.dart';
import 'package:credit/Services/agence_services.dart';
import 'package:credit/Widget/drawer_menu_widget.dart';
import 'package:credit/Widget/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListeAgence extends StatefulWidget {
  const ListeAgence({Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ListeAgence createState() => _ListeAgence();
}

// ignore: must_be_immutable
class _ListeAgence extends State<ListeAgence> {
  List<Agence>? _agences = [];
  List<Agence> agencess = [];
  late Timer timer;
  late final DismissDirectionCallback? onDismissed;
  List<Agence>? results;
  String query = '';
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  bool isDragging = false;
  late bool isDraweropen;

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scaleFactor = 0.6;
        isDraweropen = true;
      });
  void _runFilter(String enteredKeyword) {
    setState(() {
      //  if (enteredKeyword.isEmpty) {
      //results = _agences;

      // getAgence();
      // }
      results = _agences!
          .where((agence) =>
              agence.nom.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              agence.code
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()) ||
              agence.adresse
                  .toLowerCase()
                  .contains(enteredKeyword.toLowerCase()))
          .toList();

      // _agences = results;
    });
  }

  getAgence() async {
    // _agences = await AgenceServices.getAgencesByEtat(true);
    AgenceServices.getAgencesByEtat(true).then((value) {
      setState(() {
        _agences!.addAll(value!);
        results = _agences;
      });
    });
    // Provider.of<AgenceData>(context, listen: false).agences = _agences!;
  }

  @override
  void initState() {
    getAgence();

    super.initState();

    // timer = Timer.periodic(Duration(seconds: 5), (Timer t) => getAgence());
  }

  @override
  Widget build(BuildContext context) {
    final VoidCallback openDrawer;
    return results == null
        ? Scaffold(
            backgroundColor: Colors.grey[350],
            appBar: AppBar(
              backgroundColor: Colors.orange[300],
              title: const Text('Liste Agence'),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SettingPage(
                              openDrawer: this.openDrawer,
                            );
                          },
                        ),
                      );
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.grey[350],
            appBar: AppBar(
              backgroundColor: Colors.orange[300],
              title: const Text('Liste Agence'),
              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SettingPage(
                              openDrawer: this.openDrawer,
                            );
                          },
                        ),
                      );
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  buildSearch(),
                  Expanded(
                      child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    itemCount: results!.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Agence agence = results![index];

                      return Dismissible(
                        key: UniqueKey(),
                        child: Card(
                          key: ValueKey(_agences![index].nom),
                          child: TextField(
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.orange)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        const BorderSide(color: Colors.orange)),
                                hintText: agence.nom,
                                hintStyle:
                                    const TextStyle(color: Colors.orange),
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                              onTap: () async {
                                setState(() {
                                  _showMyDialogAgence(
                                      context, _agences![index]);
                                });
                                const SizedBox(
                                  height: 20,
                                );
                              }),
                        ),
                        onDismissed: (direction) {
                          _agences!.removeAt(index);
                        },
                        confirmDismiss: (direction) =>
                            prompt(direction, context, _agences![index]),
                      );
                    },
                  )),
                ],
              ),
            ),
          );
  }

  Widget buildSearch() => SearchWidget(
      text: query,
      onChanged: (value) {
        setState(() {
          _runFilter(value);
        });
      },
      hintText: " recherche une agence");
}

Future<void> _showMyDialogAgence(BuildContext context, Agence _agence) async {
  String? nom;
  late String adresse;
  String? code;
  late String description;
  final nomText = TextEditingController();
  nomText.text = _agence.nom;
  final adresseText = TextEditingController();
  adresseText.text = _agence.adresse;
  final codeText = TextEditingController();
  codeText.text = _agence.code;
  final descriptionText = TextEditingController();
  descriptionText.text = _agence.description;
  String? errornom;
  String? errorcode;
  int? id = _agence.id;

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  Agence? agence;
  Agence? agence1;
  return await showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (context) => StatefulBuilder(
      builder: (context, setState) => AlertDialog(
        title: const Text(
          'Detail Agence',
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
                    AgenceServices.getAgenceByName(nomText.text).then((value) {
                      setState(() {
                        if (value != null && nomText.text != _agence.nom) {
                          agence = value;
                          // print(agence?.nom);
                          errornom = "nom exsite";
                        } else {
                          errornom = null;
                          agence = null;
                        }
                        print(errornom);

                        AgenceServices.getAgenceByCode(codeText.text)
                            .then((val) {
                          setState(() {
                            if (val != null && codeText.text != _agence.code) {
                              agence = value;
                              // print(agence1?.code);
                              errorcode = "code exsite";
                            } else {
                              errorcode = null;
                              agence1 = null;
                            }
                            print(errorcode);
                            if (fromKey.currentState?.validate() == true &&
                                errornom == null &&
                                errorcode == null) {
                              final Agence agence = Agence(
                                  nom: nomText.text,
                                  adresse: adresseText.text,
                                  code: codeText.text,
                                  description: descriptionText.text,
                                  etat: true);
                              setState(() {
                                Provider.of<AgenceData>(context, listen: false)
                                    .updateAgence(id!, agence);

                                MessageValider();

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ListeAgence()), // this mymainpage is your page to refresh
                                  (Route<dynamic> route) => false,
                                );
                              });
                            }
                          });
                        });
                      });
                    });

                    /* if (fromKey.currentState?.validate() == true &&
                          errornom == null) {
                        final Agence agence = Agence(
                            nom: nomText.text,
                            adresse: adresseText.text,
                            code: codeText.text,
                            description: descriptionText.text,
                            etat: true);
                              setState(() {
                        Provider.of<AgenceData>(context, listen: false)
                            .updateAgence(id!, agence);

                        MessageValider();
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListeAgence()),
                          ).then((va) => setState(() {}));*/
                          });
                      }*/
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
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      width: 2,
                      color: Colors.orange,
                    ),
                  ),
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

void MessageValider() => Fluttertoast.showToast(msg: "Succées", fontSize: 18);
Future<bool?> prompt(
    DismissDirection direction, BuildContext context, Agence _agence) async {
  int? id = _agence.id;
  if (direction == DismissDirection.startToEnd) {
    // This is a delete action

    return await showCupertinoDialog<bool>(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            content: Text("Etes-vous sûr que vous voulez supprimer?"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Ok"),
                onPressed: () {
                  final Agence agence = Agence(
                      nom: _agence.nom,
                      adresse: _agence.adresse,
                      code: _agence.code,
                      description: _agence.description,
                      etat: false);

                  Provider.of<AgenceData>(context, listen: false)
                      .updateAgence(id!, agence);
                  Navigator.of(context).pop(true);
                },
              ),
              CupertinoDialogAction(
                child: Text('Annuler'),
                onPressed: () {
                  // Dismiss the dialog but don't
                  // dismiss the swiped item
                  return Navigator.of(context).pop(false);
                },
              )
            ],
          ),
        ) ??
        false; // In case the user dismisses the dialog by clicking away from it
  }
}
