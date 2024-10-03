import 'package:flutter/material.dart';

class myInkWell extends StatelessWidget {
  Widget child;
  dynamic onTap;

  myInkWell({required this.child, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        child: child,
        onTap: () => onTap());
  }
}
