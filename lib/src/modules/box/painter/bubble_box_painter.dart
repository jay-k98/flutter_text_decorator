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
/// ```
class BubbleBoxPainter extends CustomPainter {
  final Text text;
  final double padding; //! TODO: fix text not being centered
  final Color bubbleColor;
  final double borderRadius;
  final BubbleBoxTip tip;

  BubbleBoxPainter({
    required this.text,
    required this.padding,
    required this.bubbleColor,
    super.repaint,
    this.borderRadius = 8,
    this.tip = const BubbleBoxTip(),
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = bubbleColor
      ..strokeWidth = 2 // TODO: add as param?
      ..style = PaintingStyle.stroke;

    // Calculate text size
    final textPainter = TextPainter(
      text: TextSpan(text: text.data, style: text.style),
      textDirection: TextDirection.ltr,
    )..layout();

    final textWidth = textPainter.width;
    final textHeight = textPainter.height;

    // Calculate bubble size
    final bubbleWidth = textWidth + padding * 2;
    final bubbleHeight = textHeight + padding * 2;

    // Calculate tail size
    //! TODO: extract
    final tailHeight = bubbleHeight * 0.25;

    final path = Path()

      // Top left corner
      ..moveTo(0, borderRadius)
      ..quadraticBezierTo(0, 0, borderRadius, 0)

      // Top right corner
      ..lineTo(bubbleWidth - borderRadius, 0)
      ..quadraticBezierTo(bubbleWidth, 0, bubbleWidth, borderRadius)

      // Bottom right corner
      ..lineTo(bubbleWidth, bubbleHeight - borderRadius)
      ..quadraticBezierTo(bubbleWidth, bubbleHeight, bubbleWidth - borderRadius, bubbleHeight);

    final double tipOffset = bubbleWidth * 0.05;

    final double tipStart = bubbleWidth * tip.position.percentage;
    final double tipBaseWidth = bubbleWidth * 0.2;
    final double tipEnd = tipStart - tipBaseWidth;
    double tipPeak = tipEnd - tipOffset;
    if (tip.orientation == TipOrientation.right) {
      tipPeak = tipStart + tipOffset;
    }

    // Bottom left corner with tail
    path
      ..lineTo(tipStart, bubbleHeight)
      ..lineTo(tipPeak, bubbleHeight + tailHeight)
      ..lineTo(tipEnd, bubbleHeight)
      ..lineTo(borderRadius, bubbleHeight)
      ..quadraticBezierTo(0, bubbleHeight, 0, bubbleHeight - borderRadius)
      ..close();

    // Draw the bubble
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
