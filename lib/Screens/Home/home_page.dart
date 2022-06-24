import 'package:credit/Widget/drawer_menu_widget.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final VoidCallback openDrawer;
  const HomePage({Key? key, required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          backgroundColor: Colors.orange[300],
          title: const Text('Accuiel'),
          leading: DrawerMenuWidget(
            onClicked: openDrawer,
          ),
        ),
      );
}
