import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/underline/classes/horizontal_offset.dart';

/// An abstract base class for [CustomPainter] implementations that draw
/// various styles of underlines beneath text.
///
/// This class provides common properties that all specific underline painter
/// implementations will share.
/// Subclasses are expected to implement the `paint` method to define the
/// actual drawing logic for their specific underline style.
///
/// Properties:
/// - `color`: The [Color] of the underline.
/// - `strokeWidth`: The thickness of the underline.
/// - `textStyle`: The [TextStyle] of the text being underlined. This can be
///   used by subclasses to adjust the underline's position or appearance
///   relative to the text (e.g., based on font size or baseline).
/// - `horizontalOffset`: A [HorizontalOffset] that allows for adjusting the
///   start and end points of the underline horizontally relative to the text's width.
///   This can be used to extend the underline beyond the text or to indent it.
abstract class UnderlinePainter extends CustomPainter {
  final Color color;
  final TextStyle? textStyle;
  final double strokeWidth;
  final HorizontalOffset horizontalOffset;
  UnderlinePainter({
    required this.color,
    required this.strokeWidth,
    this.textStyle,
    this.horizontalOffset = const HorizontalOffset(0, 0),
  });
}
