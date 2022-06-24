import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonTapped extends StatelessWidget {
  var icon;
  ButtonTapped({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Icon(
        icon,
        size: 18,
        color: Colors.grey[700],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: [
          const BoxShadow(
              color: Colors.white,
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.grey.shade600,
              offset: const Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ],
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.grey.shade700,
              Colors.grey.shade600,
              Colors.grey.shade500,
              Colors.grey.shade200,
            ],
            stops: const [
              0,
              0.1,
              0.3,
              1,
            ]),
      ),
    );
  }
}
