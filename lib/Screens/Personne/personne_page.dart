import 'package:credit/Data/sexe.dart';
import 'package:credit/Models/Personne/personne.dart';
import 'package:credit/Models/Profession/profession.dart';
import 'package:credit/Models/Role/role.dart';
import 'package:credit/Models/Secteur/secteur.dart';
import 'package:credit/Models/User/user.dart';
import 'package:credit/Services/personne_services.dart';
import 'package:credit/Services/profession_services.dart';
import 'package:credit/Services/role_services.dart';
import 'package:credit/Services/secteur_services.dart';
import 'package:credit/Services/user_services.dart';
import 'package:credit/Widget/imageprofile.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class PersonnePage extends StatefulWidget {
  const PersonnePage({Key? key}) : super(key: key);
  _PersonnePage createState() => _PersonnePage();
}

class _PersonnePage extends State<PersonnePage> {
  List<Secteur> results = [];
  List<Secteur> secteurs = [];
  List<Profession> results1 = [];
  List<Profession> professions = [];
  Sexe? _sexe;
  String sexe = "";
  String? _secteur;
  String? _profession;
  String login = "";
  String nom = "";
  String prenom = "";
  int cin = 0;
  int tel = 0;
  String adresse = "";
  DateTime date = DateTime.now();
  final sexeText = TextEditingController();
  final nomText = TextEditingController();
  final prenomText = TextEditingController();
  final loginText = TextEditingController();
  final passwordeText = TextEditingController();
  final confirmpasswordeText = TextEditingController();
  final dateText = TextEditingController();
  final adresseText = TextEditingController();
  final mailText = TextEditingController();
  final telText = TextEditingController();
  final cinText = TextEditingController();
  String? confirmerror;
  String Title = 'selecte';
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  String? errorlogin;
  getSecteur() async {
    SecteurServices.getSecteurByEtat(true).then((value) {
      setState(() {
        secteurs.addAll(value);
        results = secteurs;
        print(results);
      });
    });
  }

  getProfession() async {
    ProfessionServices.getProfessionByEtat(true).then((value) {
      setState(() {
        professions.addAll(value);
        results1 = professions;
        print(results1);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getSecteur();
    getProfession();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        Title = date.day.toString() +
            "/" +
            date.month.toString() +
            "/" +
            date.year.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('Personne'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Container(
            margin: const EdgeInsets.only(top: 70, left: 10, right: 30),
            child: Column(children: <Widget>[
              const ImageProfile(),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "Nom client",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir Nom")],
                ),
                onChanged: (val) {},
                controller: nomText,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "Prenom client",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir prenom")],
                ),
                onChanged: (val) {},
                controller: prenomText,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: " Nom d'utilisateur",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                  errorText: errorlogin,
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir Username")],
                ),
                onChanged: (val) async {
                  login = val;
                },
                controller: loginText,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "Mot de Passe",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir Mot de Passe")],
                ),
                onChanged: (val) {},
                controller: passwordeText,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "Confimer le Mot de Passe",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                  errorText: confirmerror,
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir mot de passe")],
                ),
                onChanged: (val) {},
                controller: confirmpasswordeText,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "Sexe",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "choisir Sexe")],
                ),
                enabled: false,
                onChanged: (val) {},
                controller: sexeText,
              ),
              Row(children: [
                Radio(
                  value: Sexe.Homme,
                  groupValue: _sexe,
                  onChanged: (Sexe? value) async {
                    setState(() {
                      _sexe = value;
                      sexe = 'Homme';
                      sexeText.text = 'Homme';
                    });
                  },
                  activeColor: Colors.orange,
                ),
                const Text(
                  "Homme",
                  style: TextStyle(fontSize: 15, color: Colors.orange),
                ),
                Radio(
                  value: Sexe.Femme,
                  groupValue: _sexe,
                  onChanged: (Sexe? value) async {
                    setState(() {
                      _sexe = value;
                      sexe = 'Femme';
                      sexeText.text = 'Femme';
                    });
                  },
                  activeColor: Colors.orange,
                ),
                const Text(
                  "Femme",
                  style: TextStyle(fontSize: 15, color: Colors.orange),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.only(right: 10),
                  // symmetric(horizontal: 5, vertical: 5),
                  shape: const StadiumBorder(),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.orange,
                  ),
                ),
                onPressed: () async => _selectDate(context),
                child: const Text(
                  " Date de Naissance",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RaisedButton(
                onPressed: () => _selectDate(context),
                child: Text(
                  "$Title",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("${date.toLocal()}".split(' ')[0]),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "Adresee",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir Adresse")],
                ),
                onChanged: (val) {},
                controller: adresseText,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "E-mail",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir Email")],
                ),
                onChanged: (val) {},
                controller: mailText,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "Tel",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir Telephone")],
                ),
                onChanged: (val) {},
                controller: telText,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.transparent)),
                  hintText: "CIN",
                  hintStyle: const TextStyle(color: Colors.orange),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: MultiValidator(
                  [RequiredValidator(errorText: "remplir CIN")],
                ),
                onChanged: (val) {},
                controller: cinText,
              ),
              const SizedBox(
                height: 30,
              ),
              DropdownButton<String>(
                items: results.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.nom),
                    value: item.nom.toString(),
                  );
                }).toList(),
                onChanged: (newValue) async {
                  setState(() {
                    _secteur = newValue;
                  });
                  print(_secteur);
                },
                isExpanded: true,
                hint: const Text(
                  "Secteur",
                  style: TextStyle(color: Colors.orange),
                ),
                value: _secteur,
              ),
              const SizedBox(
                height: 30,
              ),
              DropdownButton<String>(
                items: results1.map((item) {
                  return DropdownMenuItem(
                    child: Text(item.nom),
                    value: item.nom.toString(),
                  );
                }).toList(),
                onChanged: (newValue) async {
                  setState(() {
                    _profession = newValue;
                  });
                  print(_profession);
                },
                isExpanded: true,
                hint: const Text(
                  "Profession",
                  style: TextStyle(color: Colors.orange),
                ),
                value: _profession,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      shape: const StadiumBorder(),
                      side: const BorderSide(
                        width: 2,
                        color: Colors.orange,
                      ),
                    ),
                    onPressed: () async {
                      UserServices.getUserByLogin(loginText.text).then((value) {
                        setState(() {
                          if (value != null) {
                            errorlogin = "login exsite";
                          } else {
                            errorlogin = null;

                            if (passwordeText.text !=
                                confirmpasswordeText.text) {
                              confirmerror = "mot de passe doit confimer";
                            } else {
                              print("rrr");
                              if (fromKey.currentState?.validate() == true) {
                                setState(() {
                                  SecteurServices.getSecteurByName(_secteur!)
                                      .then((value) {
                                    setState(() {
                                      final Secteur? secteur;
                                      secteur = value;
                                      print(secteur);
                                      ProfessionServices.getProfessionByName(
                                              _profession!)
                                          .then((value) {
                                        setState(() {
                                          final Profession? profession;
                                          profession = value!;
                                          print(profession);
                                          List<Role> rolee;
                                          RoleServices.getRoleByName("nom")
                                              .then((value) {
                                            setState(() {
                                              List<Role> role = [];

                                              role.add(value);
                                              rolee = role;
                                              final User user = User(
                                                  login: loginText.text,
                                                  password: passwordeText.text,
                                                  roles: rolee,
                                                  etat: true);

                                              UserServices.addUser(
                                                  user.login,
                                                  user.password,
                                                  user.roles,
                                                  user.etat);
                                              print(nomText.text);

                                              print(user.roles);
                                              final Personne personne =
                                                  Personne(
                                                      nom: nomText.text,
                                                      prenom: prenomText.text,
                                                      sexe: sexeText.text,
                                                      naissance: Title,
                                                      adresse: adresseText.text,
                                                      mail: mailText.text,
                                                      tel: int.parse(
                                                          telText.text),
                                                      cin: int.parse(
                                                          cinText.text),
                                                      secteur: secteur!,
                                                      profession: profession!,
                                                      user: User(
                                                          id: user.id,
                                                          login: user.login,
                                                          password:
                                                              user.password,
                                                          roles: user.roles,
                                                          etat: user.etat),
                                                      etat: true);
                                              print(personne);
                                              PersonneServices.addPersonne(
                                                  personne.nom,
                                                  personne.prenom,
                                                  personne.sexe,
                                                  personne.naissance,
                                                  personne.adresse,
                                                  personne.mail,
                                                  personne.tel,
                                                  personne.cin,
                                                  personne.profession,
                                                  personne.secteur,
                                                  user,
                                                  true);

                                              Navigator.of(context).pop();
                                              MessageValider();
                                            });
                                          });
                                        });
                                      });
                                    });
                                  });
                                });
                              }
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
                      padding: const EdgeInsets.symmetric(horizontal: 25),
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
            ]),
          ),
        ),
      ),
    );
  }

  void MessageValider() => Fluttertoast.showToast(msg: "Succées", fontSize: 18);
}
