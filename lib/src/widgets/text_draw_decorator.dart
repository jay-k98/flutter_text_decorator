import 'package:flutter/material.dart';
import 'package:flutter_text_decorator/src/modules/box/enums/box_style.dart';
import 'package:flutter_text_decorator/src/modules/circle/decorations/circle_decoration.dart';
import 'package:flutter_text_decorator/src/modules/circle/enums/circle_style.dart';
import 'package:flutter_text_decorator/src/modules/highlight/enums/highlight_style.dart';
import 'package:flutter_text_decorator/src/modules/underline/enums/underline_style.dart';

class TextDecorator extends StatelessWidget {
  final Text text;
  final CustomPainter painter;

  const TextDecorator({
    required this.text,
    required this.painter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: painter,
      child: text,
    );
  }

  factory TextDecorator.circled({
    required Text text,
    CircleStyle style = CircleStyle.circled,
    CircleDecoration? decoration,
  }) {
    return TextDecorator(
      text: text,
      painter: style.getPainter(text, decoration: CircleDecoration.standard()),
    );
  }

  factory TextDecorator.underlined({
    required Text text,
    UnderlineStyle style = UnderlineStyle.horizontal,
    Color color = Colors.black,
    double strokeWidth = 1,
  }) {
    return TextDecorator(
      text: text,
      painter: style.getPainter(text, color, strokeWidth),
    );
  }

  factory TextDecorator.boxed({
    required Text text,
    BoxStyle style = BoxStyle.bubble,
    double borderRadius = 1,
    double strokeWidth = 1,
  }) {
    return TextDecorator(
      text: text,
      painter: style.getPainter(text, borderRadius, strokeWidth),
    );
  }

  factory TextDecorator.highlighted({
    required Text text,
    HighlightStyle style = HighlightStyle.marker,
    Color? color,
    double? strokeWidth,
  }) {
    return TextDecorator(text: text, painter: style.getPainter(text, color, strokeWidth));
  }
}
