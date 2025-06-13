import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/box/decorations/bubble_box_tip.dart';

/// A [CustomPainter] that draws a speech bubble-like box around a given [Text] widget.
///
/// This painter creates a rounded rectangle with a "tip" or "tail" pointing outwards,
/// commonly used to represent speech or thoughts in UI design. The appearance of
/// the bubble, including its color, corner roundness, padding around the text,
/// and the characteristics of the tip (its position and orientation), can be customized.
///
/// The painter calculates the size of the provided text to determine the overall
/// dimensions of the bubble. The tip's geometry is then calculated based on the
/// bubble's width and the properties defined in the [BubbleBoxTip] object.
///
/// Key properties:
/// - `text`: The [Text] widget to be enclosed by the bubble.
/// - `padding`: The space between the text and the bubble's edges.
/// - `bubbleColor`: The color of the bubble's outline.
/// - `borderRadius`: The radius for the rounded corners of the bubble.
/// - `tip`: A [BubbleBoxTip] object defining the tip's position, orientation, and size.
/// ```(dart)
class BubbleBoxPainter extends CustomPainter {
  BubbleBoxPainter({
    required this.text,
    required this.bubbleColor,
    required this.padding,
    super.repaint,
    this.borderRadius = 8,
    this.tip = const BubbleBoxTip(),
  });
  final Text text;
  final EdgeInsets padding;
  final Color bubbleColor;
  final double borderRadius;
  final BubbleBoxTip tip;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = bubbleColor
      ..strokeWidth = 2 // TODO(everyone): add as param?
      ..style = PaintingStyle.stroke;

    // Calculate text size
    final textPainter = TextPainter(
      text: TextSpan(text: text.data, style: text.style),
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;
    final availableWidth = min(textWidth, size.width);
    final textHeight = textPainter.height;
    final availableHeight = max(textHeight, size.height);

    // Calculate bubble size
    final bubbleWidth = availableWidth + padding.horizontal;
    final bubbleHeight = availableHeight + padding.vertical;

    // Calculate tail size
    // TODO(everyone): extract
    final tailHeight = bubbleHeight * 0.25;

    final path = Path()

      // Top left corner
      ..moveTo(0 - padding.left, borderRadius - padding.top)
      ..quadraticBezierTo(0 - padding.left, 0 - padding.top, borderRadius - padding.left, 0 - padding.top)

      // Top right corner
      ..lineTo(bubbleWidth - borderRadius - padding.left, 0 - padding.top)
      ..quadraticBezierTo(bubbleWidth - padding.left, 0 - padding.top, bubbleWidth - padding.left, borderRadius - padding.top)

      // Bottom right corner
      ..lineTo(bubbleWidth - padding.left, bubbleHeight - borderRadius - padding.top)
      ..quadraticBezierTo(bubbleWidth - padding.left, bubbleHeight - padding.top, bubbleWidth - borderRadius - padding.left, bubbleHeight - padding.top);

    final tipOffset = bubbleWidth * 0.05;

    final tipStart = bubbleWidth * tip.position.percentage;
    final tipBaseWidth = bubbleWidth * 0.2;
    final tipEnd = tipStart - tipBaseWidth;
    var tipPeak = tipEnd - tipOffset;
    if (tip.orientation == TipOrientation.right) {
      tipPeak = tipStart + tipOffset;
    }

    // Bottom left corner with tail
    path
      ..lineTo(tipStart, bubbleHeight - padding.top)
      ..lineTo(tipPeak, bubbleHeight + tailHeight - padding.top)
      ..lineTo(tipEnd, bubbleHeight - padding.top)
      ..lineTo(borderRadius - padding.left, bubbleHeight - padding.top)
      ..quadraticBezierTo(0 - padding.left, bubbleHeight - padding.top, 0 - padding.left, bubbleHeight - borderRadius - padding.top)
      ..close();

    // Draw the bubble
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
