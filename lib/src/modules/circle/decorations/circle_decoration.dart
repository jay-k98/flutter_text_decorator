import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/base/decoration_base.dart';

/// A specific [DecorationBase] implementation for circular decorations.
///
/// This class provides the [color] and [strokeWidth] properties required
/// by painters that draw circular shapes around text. It inherits these
/// properties from [DecorationBase].
///
class CircleDecoration extends DecorationBase {
  const CircleDecoration({
    required super.color,
    required super.strokeWidth,
  });

  /// Creates a standard [CircleDecoration] with a default color and a stroke width.
  factory CircleDecoration.standard() {
    return const CircleDecoration(color: Colors.orange, strokeWidth: 1);
  }
}
