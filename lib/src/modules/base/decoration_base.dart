import 'package:flutter/material.dart';

/// An abstract base class for defining common styling properties for text decorations.
///
/// This class serves as a contract for specific decoration types (e.g.,
/// [CircleDecoration]), ensuring they provide essential visual attributes
/// like [color] and [strokeWidth].
///
abstract class DecorationBase {
  final Color color;
  final double strokeWidth;

  const DecorationBase({
    required this.color,
    required this.strokeWidth,
  });
}
