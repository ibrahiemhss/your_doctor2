import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class Grad extends StatefulWidget {
  Widget child;
  double height;
  double width;

  Grad({this.child, this.height, this.width});

  @override
  GradState createState() =>
      GradState();
}

class GradState extends State<Grad> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
      height: widget.height == null ? double.infinity : widget.height,
      width: widget.width == null ? double.maxFinite : widget.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment(0, 1), //
          colors: [const Color(0xFF003B55), const Color(0xaa005B5B)],
          tileMode: TileMode.clamp,
        ),
      ),
    );
  }
}
