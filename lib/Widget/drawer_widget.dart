import 'package:credit/Data/drawer_Items.dart';
import 'package:credit/Models/drawer_item.dart';

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerWidget({Key? key, required this.onSelectedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [buildDrawerItems(context)],
        ),
      );

  Widget buildDrawerItems(BuildContext context) => Column(
        children: DrawerIteams.all
            .map(
              (item) => ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                leading: Icon(
                  item.icon,
                  color: Colors.white,
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(color: Colors.white, fontSize: 22),
                ),
                onTap: () => onSelectedItem(item),
              ),
            )
            .toList(),
      );
}
