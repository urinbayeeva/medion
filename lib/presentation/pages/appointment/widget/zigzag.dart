import 'package:flutter/material.dart';

class ZigZagContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double zigZagHeight;
  final EdgeInsetsGeometry? padding;

  const ZigZagContainer({
    Key? key,
    required this.child,
    this.color = Colors.blue,
    this.zigZagHeight = 15.0,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: DoubleZigZagClipper(zigZagHeight),
      child: Container(
        color: color,
        padding: padding,
        child: child,
      ),
    );
  }
}

class DoubleZigZagClipper extends CustomClipper<Path> {
  final double zigZagHeight;

  DoubleZigZagClipper(this.zigZagHeight);

  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    // Start at top-left corner
    path.moveTo(0, zigZagHeight);

    // Create top zigzag
    for (double i = 0; i < width; i += zigZagHeight * 2) {
      path.relativeLineTo(zigZagHeight, -zigZagHeight);
      path.relativeLineTo(zigZagHeight, zigZagHeight);
    }

    path.lineTo(width, height - zigZagHeight);

    for (double i = width; i > 0; i -= zigZagHeight * 2) {
      path.relativeLineTo(-zigZagHeight, zigZagHeight);
      path.relativeLineTo(-zigZagHeight, -zigZagHeight);
    }

    // Close the path
    path.lineTo(0, zigZagHeight);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
