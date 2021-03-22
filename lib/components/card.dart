import 'package:bmi/components/themes.dart';
import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Function onTap;
  final Widget child;
  final Color color;

  ReusableCard({this.onTap, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color != null ? color : inactiveColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: child,
        ),
      ),
    );
  }
}
