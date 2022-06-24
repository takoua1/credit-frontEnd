import 'package:credit/Screens/Personne/personne_page.dart';
import 'package:flutter/material.dart';

class ChoixClient extends StatelessWidget {
  const ChoixClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.orange[300],
        title: const Text('Choix Inscription'),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 150, left: 80),
        child: Column(children: [
          Row(children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 80),
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
                      return const PersonnePage();
                    },
                  ),
                );
              },
              child: const Text(
                "Personne",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
          ]),
          const SizedBox(height: 50),
          Row(children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                shape: const StadiumBorder(),
                side: const BorderSide(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Entreprise",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ]),
          const SizedBox(height: 50),
          Row(children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                shape: const StadiumBorder(),
                side: const BorderSide(
                  width: 2,
                  color: Colors.orange,
                ),
              ),
              onPressed: () {},
              child: const Text(
                "Groupe",
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ]),
        ]),
      ),
    );
  }
}
