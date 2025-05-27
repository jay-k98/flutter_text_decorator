import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/circle/decorations/circle_decoration.dart';
import 'package:flutter_text_decorator/src/modules/circle/painter/closed_circle_painter.dart';
import 'package:flutter_text_decorator/src/modules/circle/painter/open_circle_painter.dart';

/// Defines the different styles available for circular decorations around text.
///
/// Each style corresponds to a specific [CustomPainter] that will be used
/// to render the circle. The [getPainter] method is used to retrieve the
/// appropriate painter instance based on the enum value.
enum CircleStyle {
  basic,
  circled;

  /// Returns the [CustomPainter] corresponding to the circle style.
  ///
  /// - `text`: The [Text] widget to be decorated. The painter will use
  ///   `text.data` (or an empty string if null) and `text.style`
  ///   (or a default `TextStyle` if null).
  /// - `decoration`: A [CircleDecoration] object that defines the appearance
  ///   (e.g., color, strokeWidth) of the circle. Defaults to a standard
  ///   orange circle with a stroke width of 1 if not provided.
  CustomPainter getPainter(Text text, {CircleDecoration decoration = const CircleDecoration(color: Colors.orange, strokeWidth: 1)}) {
    switch (this) {
      case CircleStyle.basic:
        return ClosedCirclePainter(text: text.data ?? '', textStyle: text.style ?? const TextStyle(), decoration: decoration);
      case CircleStyle.circled:
        return OpenCirclePainter(text: text.data ?? '', textStyle: text.style ?? const TextStyle(), decoration: decoration);
    }
  }
}
