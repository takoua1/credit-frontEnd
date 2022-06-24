import 'package:flutter/material.dart';

class Dialogue extends StatefulWidget {
  List<TextField> textFiled;
  Widget? child;
  List<OutlinedButton> outlineButton;
  // ignore: non_constant_identifier_names
  Dialogue(
      {Key? key,
      required this.textFiled,
      required this.child,
      required this.outlineButton})
      : super(key: key);
  @override
  _Dialogue createState() => _Dialogue();
}

class _Dialogue extends State<Dialogue> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
