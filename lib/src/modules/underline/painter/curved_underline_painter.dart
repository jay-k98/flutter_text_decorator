import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/underline/base/underline_painter.dart';

/// A [CustomPainter] that draws a curved or wavy underline beneath text.
///
/// This painter extends [UnderlinePainter] and implements a specific style
/// of underline that uses a cubic Bezier curve to create a flowing,
/// non-straight line.
///
/// Key properties inherited or used:
/// - `text`: The [String] content to be underlined.
/// - `color`: The [Color] of the underline.
/// - `strokeWidth`: The thickness of the underline.
/// - `textStyle`: The [TextStyle] of the text, used for layout by `TextPainter`
///   to help determine the path of the curve relative to the text dimensions.
///
/// The curve's control points are calculated relative to the `size` of the canvas
/// and the `textPainter.width` to create its characteristic shape.
///
/// Example (conceptual, as direct usage might be part of a larger framework):
/// ```dart
/// CustomPaint(
///   painter: CurvedUnderlinePainter(
///     text: "Curvy Text",
///     color: Colors.blue,
///     strokeWidth: 2.0,
///     textStyle: TextStyle(fontSize: 18),
///   ),
/// )
/// ```
class CurvedUnderlinePainter extends UnderlinePainter {
  CurvedUnderlinePainter({required this.text, required super.color, required super.strokeWidth, super.textStyle});

  final String text;

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    final path = Path()
      ..moveTo(5, size.height * 1.1)
      ..cubicTo(
        size.width - textPainter.width / 2,
        size.height + 1,
        size.width - textPainter.width / 4,
        size.height - 7,
        size.width,
        size.height,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
