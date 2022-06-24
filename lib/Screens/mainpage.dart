import 'package:credit/Data/drawer_Items.dart';
import 'package:credit/Models/drawer_item.dart';
import 'package:credit/Screens/Agence/liste_agence.dart';
import 'package:credit/Screens/Home/home_page.dart';
import 'package:credit/Screens/Setting/setting_page.dart';
import 'package:credit/Screens/Welcome/welcome.dart';
import 'package:credit/Widget/drawer_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  bool isDragging = false;
  late bool isDraweropen;
  DrawerItem item = DrawerIteams.home;
  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void closeDrawer() => setState(() {
        xOffset = 0;
        yOffset = 0;
        scaleFactor = 1;
        isDraweropen = false;
      });

  void openDrawer() => setState(() {
        xOffset = 230;
        yOffset = 150;
        scaleFactor = 0.6;
        isDraweropen = true;
      });

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Stack(
          children: [
            buildDrawer(),
            buildPage(),
          ],
        ),
      );
  Widget buildDrawer() => DrawerWidget(
        onSelectedItem: (item) {
          setState(() => this.item = item);
          closeDrawer();
        },
      );

  // ignore: non_constant_identifier_names
  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDraweropen) closeDrawer();
        return false;
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: const Duration(microseconds: 2500000),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDragging,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDraweropen ? 20 : 0),
              child: Container(
                color: isDragging
                    ? Colors.white10
                    : Theme.of(context).primaryColor,
                child: getDrawerPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerIteams.setting:
        return SettingPage(openDrawer: openDrawer);
      case DrawerIteams.logout:
        return const Welcome();

      default:
        return HomePage(openDrawer: openDrawer);
    }
  }
}
