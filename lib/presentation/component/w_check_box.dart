import 'dart:ui';

import 'package:flutter/material.dart';

enum CheckBoxShape { round, triangle, square }

class WCheckBox extends StatefulWidget {
  final CheckBoxShape shape;
  final bool value;
  final bool half;
  final Color checkBoxColor;
  final Color borderColor;
  final Color iconColor;
  final double size;
  final ValueChanged<bool> onChanged;
  final bool useAnimation;

  const WCheckBox({
    this.shape = CheckBoxShape.square,
    required this.value,
    this.half = false,
    this.size = 20,
    required this.onChanged,
    this.checkBoxColor = Colors.blue,
    this.iconColor = Colors.white,
    this.borderColor = Colors.blue,
    this.useAnimation = true,
    super.key,
  });

  @override
  State<WCheckBox> createState() => _WCheckBoxState();
}

class _WCheckBoxState extends State<WCheckBox> with SingleTickerProviderStateMixin {
  late final AnimationController _checkController;
  late final Animation<double> _checkAnimation;

  @override
  void initState() {
    super.initState();
    _checkController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.useAnimation ? 500 : 0),
    );
    _checkAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _checkController, curve: Curves.easeInOutCirc));
    if (widget.value) {
      _checkController.forward(from: 0);
    }
  }

  @override
  void didUpdateWidget(WCheckBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      if (widget.value) {
        _checkController.forward(from: 0);
      } else {
        _checkController.reverse(from: 1);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: widget.size,
        width: widget.size,
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: () {
            switch (widget.shape) {
              case CheckBoxShape.round:
                return CircleBorder(
                  side: BorderSide(
                    color: widget.value || widget.half ? widget.checkBoxColor : widget.borderColor,
                    width: 1.5,
                  ),
                );
              case CheckBoxShape.square:
                return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                  side: BorderSide(
                    color: widget.value || widget.half ? widget.checkBoxColor : widget.borderColor,
                    width: 1.5,
                  ),
                );
              case CheckBoxShape.triangle:
                return _TriangleBorder(
                  side: BorderSide(
                    color: widget.value || widget.half ? widget.checkBoxColor : widget.borderColor,
                    width: 1.5,
                  ),
                );
            }
          }(),
          color: widget.value || widget.half ? widget.checkBoxColor : Colors.transparent,
        ),
        // decoration: BoxDecoration(
        //   color: widget.value || widget.half ? widget.checkBoxColor : Colors.transparent,
        //   borderRadius: BorderRadius.circular(6),
        //   border: Border.all(
        //     color: widget.value || widget.half ? widget.checkBoxColor : widget.borderColor,
        //     width: 1.5,
        //   ),
        // ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) => RotationTransition(
            turns: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
          child: Builder(
            builder: (context) {
              if (widget.half) {
                return Container(
                  height: widget.size * 0.1,
                  width: widget.size * 0.7,
                  decoration: BoxDecoration(
                    color: widget.iconColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                );
              } else {
                return AnimatedCheck(
                  color: widget.value ? widget.iconColor : Colors.transparent,
                  progress: _checkAnimation,
                  size: widget.size,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _TriangleBorder extends ShapeBorder {
  final BorderSide side;

  const _TriangleBorder({this.side = BorderSide.none});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(side.width);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.center.dx, rect.top) // top
      ..lineTo(rect.right, rect.bottom) // bottom right
      ..lineTo(rect.left, rect.bottom) // bottom left
      ..close();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => getOuterPath(rect);

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    final paint = side.toPaint();
    final path = getOuterPath(rect);
    canvas.drawPath(path, paint);
  }

  @override
  ShapeBorder scale(double t) => _TriangleBorder(side: side.scale(t));
}

class AnimatedCheck extends StatefulWidget {
  final Animation<double> progress;
  final double size;
  final Color? color;
  final double? strokeWidth;

  const AnimatedCheck({
    required this.progress,
    required this.size,
    this.color,
    this.strokeWidth,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _AnimatedCheckState();
}

class _AnimatedCheckState extends State<AnimatedCheck> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomPaint(
      foregroundPainter: AnimatedPathPainter(widget.progress, widget.color ?? theme.primaryColor, widget.strokeWidth),
      size: Size(
        widget.size,
        widget.size,
      ),
    );
  }
}

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimatedPathPainter(this._animation, this._color, this.strokeWidth) : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.27083 * size.width, 0.54167 * size.height)
      ..lineTo(0.41667 * size.width, 0.68750 * size.height)
      ..lineTo(0.75000 * size.width, 0.35417 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath.computeMetrics().fold(
          0.0,
          (double prev, PathMetric metric) => prev + metric.length,
        );

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;
    final path = createAnimatedPath(_createAnyPath(size), animationPercent);
    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.13;
    paint.strokeCap = StrokeCap.round;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
