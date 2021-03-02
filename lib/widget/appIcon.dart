import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class RightIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(EvaIcons.checkmark, color: Theme.of(context).accentColor);
  }
}

class WorngIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(EvaIcons.close, color: Colors.red);
  }
}
