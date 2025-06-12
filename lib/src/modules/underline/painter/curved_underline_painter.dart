import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/underline/base/underline_painter.dart';
import 'package:flutter_text_decorator/src/modules/underline/mixins/line_gap_mixin.dart';

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
class CurvedUnderlinePainter extends UnderlinePainter with LineGap {
  CurvedUnderlinePainter({
    required this.text,
    required super.color,
    required super.strokeWidth,
    this.curvyFactor = 3,
    super.textStyle,
  });

  final String text;
  final double curvyFactor;

  @override
  void paint(Canvas canvas, Size size) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle ?? const TextStyle()),
      textDirection: ui.TextDirection.ltr,
    )..layout(maxWidth: size.width);

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final lines = textPainter.computeLineMetrics();

    double yOffset = 0;

    for (final line in lines) {
      final double startX = line.left;
      final double xEnd = startX + line.width;

      if (line.width <= 0) continue;

      yOffset += calculateGapBetweenLines(line: line, lineIndex: line.lineNumber, strokeWidth: strokeWidth);

      final double y1 = yOffset - strokeWidth * curvyFactor;
      final double y2 = yOffset + strokeWidth * curvyFactor;
      final double yEnd = yOffset;
      final double x1 = startX + xEnd * (1 / 3);
      final double x2 = startX + xEnd * (2 / 3);
      final double x3 = xEnd;
      final double y3 = yEnd;

      final Path path = Path()
        ..moveTo(startX, yOffset)
        ..cubicTo(x1, y1, x2, y2, x3, y3);

      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
