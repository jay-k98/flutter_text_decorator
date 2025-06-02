import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/circle/decorations/circle_decoration.dart';

/// An abstract base class for defining common styling properties for text decorations.
///
/// This class serves as a contract for specific decoration types (e.g.,
/// [CircleDecoration]), ensuring they provide essential visual attributes
/// like [color] and [strokeWidth].
///
abstract class DecorationBase {

  const DecorationBase({
    required this.color,
    required this.strokeWidth,
  });
  final Color color;
  final double strokeWidth;
}
