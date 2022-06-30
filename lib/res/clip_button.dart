import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:syntech1/res/color.dart';

class ClipBtn extends StatelessWidget {
  const ClipBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
            child: ClipPath(
          clipper: Btn2Clipper(),
          child: Container(
            color: AppColors.backgroundColor,
            height: 200,
          ),
        )),
      ),
    );
  }
}

//wave clipper function
class BtnClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    //first point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width) / 3.24, size.height - 105);
    //third point of quadetric berzier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //forth point of quadetric berzie curve
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

//second trial clipper
class Btn1Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0.0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..quadraticBezierTo(size.width - 0, 0.0, size.width - 0.0, 0.0)
      ..lineTo(40.0, 150.0) // here you adjust the value as much as you nee
      ..quadraticBezierTo(0.0, 180.0, 0.0, 220.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class Btn2Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.5750, 0);
    path.quadraticBezierTo(size.width * 576200, size.height * 3503378,
        size.width * 0.575000, size.height * 3750800);
    path.cubicTo(
        size.width * 0.5766500,
        size.height * 0.4022750,
        size.width * 0.2723250,
        size.height * 0.3584125,
        size.width * 0.2750000,
        size.height * 0.4375000);
    path.cubicTo(
        size.width * 0.2754250,
        size.height * 0.5013875,
        size.width * 0.5733000,
        size.height * 0.4643750,
        size.width * 0.5750000,
        size.height * 0.4875000);
    path.quadraticBezierTo(size.width * 0.575000, size.height * 0.6156250,
        size.width * 0.575000, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.5750000, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
