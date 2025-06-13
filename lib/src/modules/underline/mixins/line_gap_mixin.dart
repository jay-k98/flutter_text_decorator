import 'dart:ui' as ui;

mixin LineGap {
  double calculateGapBetweenLines({
    required int lineIndex,
    required ui.LineMetrics line,
    required double strokeWidth,
  }) {
    return line.height + (line.descent / 2) + strokeWidth;
  }
}
