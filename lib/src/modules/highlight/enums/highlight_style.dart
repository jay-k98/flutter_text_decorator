import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/highlight/painter/highlight_painter.dart';

/// Defines the different styles available for highlighting text.
///
/// Each style corresponds to a specific [CustomPainter] that will be used
/// to render the highlight. The [getPainter] method is used to retrieve the
/// appropriate painter instance based on the enum value.
enum HighlightStyle {
  marker;

  /// Returns the [CustomPainter] corresponding to the highlight style.
  ///
  /// - `text`: The [Text] widget to be decorated. The painter will use
  ///   `text.data` (or an empty string if null) and `text.style`
  ///   (or a default `TextStyle` if null).
  /// - `color`: The [Color] of the highlight. If `null`, a default color
  ///   (e.g., `Colors.yellow` for `marker` style) will be used by the painter.
  /// - `strokeWidth`: The thickness or extent of the highlight. If `null`,
  ///   the painter might use a default value or calculate it based on text size.
  CustomPainter getPainter(Text text, Color? color, double? strokeWidth) {
    switch (this) {
      case HighlightStyle.marker:
        return HighlightPainter(
          text: text.data ?? '',
          color: color ?? Colors.yellow,
          textStyle: text.style ?? const TextStyle(),
          strokeWidth: strokeWidth,
        );
    }
  }
}
