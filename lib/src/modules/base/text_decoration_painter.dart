import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/base/decoration_base.dart';

/// An abstract base class for [CustomPainter] implementations that draw
/// decorations around or on text, utilizing a [DecorationBase] object
/// for common styling properties like color and stroke width.
///
/// This class provides a common structure for painters that need access to
/// the text content, its [TextStyle], and a [DecorationBase] instance
/// to define the visual characteristics of the decoration.
///
/// Subclasses are expected to implement the `paint` method to define the
/// actual drawing logic for their specific decoration style.
///
/// Properties:
/// - `text`: The [String] content to be decorated.
/// - `textStyle`: The [TextStyle] applied to the `text`.
/// - `decoration`: A [DecorationBase] instance providing base styling
abstract class TextDecoratorPainter extends CustomPainter {
  final String text;
  final TextStyle textStyle;
  final DecorationBase decoration;

  TextDecoratorPainter({
    required this.text,
    required this.textStyle,
    required this.decoration,
    super.repaint,
  });
}
