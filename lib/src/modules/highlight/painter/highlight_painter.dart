import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// A [CustomPainter] that draws a marker-style highlight over text.
///
/// This painter creates a slightly wavy, thick line that mimics the appearance
/// of a physical highlighter pen. The highlight is drawn horizontally across
/// the vertical center of the text.
///
/// Key properties:
/// - `text`: The [String] content to be highlighted.
/// - `color`: The [Color] of the highlight.
/// - `textStyle`: The [TextStyle] of the text, used to determine dimensions
///   for the highlight, particularly its default thickness.
/// - `strokeWidth`: The thickness of the highlight line. If `null`, it defaults
///   to the height of the text (calculated via `textPainter.height`).
///
/// The highlight path is a cubic Bezier curve, giving it a slightly
/// irregular, hand-drawn feel.
///
/// Example (conceptual, as direct usage might be part of a larger framework):
/// ```dart
/// CustomPaint(
///   painter: HighlightPainter(
///     text: "Important Text",
///     color: Colors.yellow.withOpacity(0.5),
///     textStyle: TextStyle(fontSize: 18),
///   ),
/// )
/// ```
class HighlightPainter extends CustomPainter {
  final String text;
  final Color color;
  final TextStyle textStyle;
  final double? strokeWidth;

  HighlightPainter({required this.text, required this.color, required this.textStyle, this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    final textSpan = TextSpan(text: text, style: textStyle);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth ?? textPainter.height;

    const yThreshold = 5;
    final horizontalOffset = textPainter.width / 4;
    final Path path = Path()
      ..moveTo(0, textPainter.height / 2)
      ..cubicTo(
        horizontalOffset,
        size.height / 2 + yThreshold,
        size.width - horizontalOffset,
        size.height / 2 - yThreshold,
        size.width,
        size.height / 2 + yThreshold,
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
