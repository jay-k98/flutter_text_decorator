import 'dart:math';

import 'package:flutter/material.dart';

/// A [CustomPainter] that draws a box with wavy edges around a given [Text] widget.
///
/// This painter creates a decorative bounding box where each side of the rectangle
/// is rendered as a series of connected curves, giving a "wavy" or "scalloped"
/// appearance. It calculates the dimensions of the provided text, including handling
/// for text that wraps to multiple lines if it exceeds the available width constraint
/// passed to the `paint` method.
///
/// The waviness is achieved by drawing multiple conic curves (`Path.conicTo`) for each
/// side of the box. The number of horizontal segments (which determines the
/// number of "waves" on the top and bottom edges), the depth of the waves (`arcHeight`),
/// and the stroke width are currently hardcoded within the painter.
///
/// To use [WavyBoxPainter], provide it with the [Text] widget to be decorated
/// and the [borderColor] for the wavy outline.
///
///
/// Example:
/// ```dart
/// CustomPaint(
///   painter: WavyBoxPainter(
///     text: Text("Some Wavy Text", style: TextStyle(fontSize: 16)),
///     borderColor: Colors.purple,
///   ),
///   child: Text(
///      "Some Wavy Text",
///       style: TextStyle(fontSize: 16),
///    ),
/// )
/// ```
class WavyBoxPainter extends CustomPainter {
  WavyBoxPainter({
    required this.text,
    required this.borderColor,
    required this.padding,
    this.nHorizontalSegments = 12,
    this.nVerticalSegments = 3,
    super.repaint,
  });
  // TODO(everyone): add padding?
  // TODO(everyone): add fill color?
  final Text text;
  final Color borderColor;
  final EdgeInsets padding;
  final int nHorizontalSegments;
  final int nVerticalSegments;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Calculate text size
    final textPainter = TextPainter(
      text: TextSpan(text: text.data, style: text.style),
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;
    var textHeight = textPainter.height;

    final heightFactor = textWidth / size.width;
    final nLines = heightFactor.ceil();
    textHeight = nLines * textHeight;

    final availableWidth = min(textWidth, size.width) + padding.horizontal;
    final availableHeight = max(textHeight, size.height) + padding.vertical;
    final widthHorizontalSegment = availableWidth / nHorizontalSegments;
    final heightVerticalSegment = availableHeight / nVerticalSegments;

    const arcHeight = -10.0;
    const weight = 1.0;
    var lastX2 = 0.0 - padding.left;

    // TODO(everyone): Fix corners, maybe with [arcTo]?
    final path = Path()..moveTo(0 - padding.left, 0 - padding.top);

    // Upper left to upper right
    for (var i = 1; i <= nHorizontalSegments; i++) {
      final x2 = (i * widthHorizontalSegment / 1.0) - padding.left;
      path.conicTo(lastX2 + widthHorizontalSegment / 2, arcHeight - padding.top, x2 / 1.0, 0 - padding.top, weight);
      lastX2 = x2;
    }

    // Upper right to lower right
    var lastY2 = 0 - padding.top;
    for (var i = 1; i <= nVerticalSegments; i++) {
      final y2 = (i * heightVerticalSegment / 1.0) - padding.top;
      path.conicTo(lastX2 - arcHeight, lastY2 + heightVerticalSegment / 2, lastX2, y2, weight);
      lastY2 = y2;
    }

    // Lower right to lower left
    for (var i = nHorizontalSegments - 1; i >= 0; i--) {
      final x2 = (i * widthHorizontalSegment / 1.0) - padding.left;
      path.conicTo(lastX2 - widthHorizontalSegment / 2, lastY2 - arcHeight, x2 / 1.0, lastY2, weight);
      lastX2 = x2;
    }

    // Lower left to upper right
    for (var i = nVerticalSegments - 1; i >= 0; i--) {
      final y2 = (i * heightVerticalSegment / 1.0) - padding.top;
      path.conicTo(arcHeight - padding.left, y2 + heightVerticalSegment / 2, 0 - padding.left, y2, weight);
      lastY2 = y2;
    }

    // Draw the bubble
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
