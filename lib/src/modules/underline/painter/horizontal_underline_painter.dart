import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/underline/base/underline_painter.dart';
import 'package:flutter_text_decorator/src/modules/underline/classes/horizontal_offset.dart';

/// A [CustomPainter] that draws a straight horizontal underline beneath text.
///
/// This painter extends [UnderlinePainter] and implements a simple,
/// standard underline style. The line is drawn from the left edge to the
/// right edge of the available canvas `size`, at the bottom of the canvas.
///
/// Key properties inherited or used:
/// - `color`: The [Color] of the underline.
/// - `strokeWidth`: The thickness of the underline.
/// - `horizontalOffset`: An optional [HorizontalOffset] to adjust the start
///   and end points of the line. `horizontalOffset.left` indents the line
///   from the left, and `horizontalOffset.right` indents it from the right.
///
/// Example (conceptual, as direct usage might be part of a larger framework):
/// ```dart
/// CustomPaint(
///   painter: HorizontalUnderlinePainter(
///     color: Colors.red,
///     strokeWidth: 1.5,
///     horizontalOffset: HorizontalOffset(5, 10),
///   ),
///   child: Text("Underlined Text"),
/// )
/// ```
class HorizontalUnderlinePainter extends UnderlinePainter {
  HorizontalUnderlinePainter({required super.color, required super.strokeWidth, super.horizontalOffset});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final path = Path()
      ..moveTo(horizontalOffset.left, size.height)
      ..lineTo(size.width - horizontalOffset.right, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
