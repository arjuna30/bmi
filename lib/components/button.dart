import 'package:bmi/components/themes.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  Button({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 3,
      constraints: BoxConstraints.tightFor(width: 55, height: 55),
      child: child,
      fillColor: accentColor,
      shape: CircleBorder(),
    );
  }
}
