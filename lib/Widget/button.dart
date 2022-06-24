import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  var icon;
  MyButton({Key? key, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Icon(
        icon,
        size: 20,
        color: Colors.grey[800],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade600,
              offset: const Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
          const BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0),
        ],
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [
              Colors.grey.shade700,
              Colors.grey.shade300,
              Colors.grey.shade400,
              Colors.grey.shade500,
            ],
            stops: const [
              0.1,
              0.3,
              0.8,
            ]),
      ),
    );
  }
}
