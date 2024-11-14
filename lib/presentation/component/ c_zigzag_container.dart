import 'package:flutter/material.dart';

class CZigZagContainer extends StatelessWidget {
  final Widget child;
  const CZigZagContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ZigzagClipper(),
      child: child,
    );
  }
}

class ZigzagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double zigzagHeight = 10.0;
    const double zigzagWidth = 20.0;

    final path = Path();

    path.moveTo(0, zigzagHeight);
    for (double x = 0; x < size.width; x += zigzagWidth) {
      path.lineTo(x + zigzagWidth / 2, 0);
      path.lineTo(x + zigzagWidth, zigzagHeight);
    }

    path.lineTo(size.width, size.height - zigzagHeight);

    for (double x = size.width; x > 0; x -= zigzagWidth) {
      path.lineTo(x - zigzagWidth / 2, size.height);
      path.lineTo(x - zigzagWidth, size.height - zigzagHeight);
    }

    path.lineTo(0, zigzagHeight);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
