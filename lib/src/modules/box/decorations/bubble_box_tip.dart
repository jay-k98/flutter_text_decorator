enum TipPosition {
  left(0.3),
  right(0.9),
  center(0.6);

  const TipPosition(this.percentage);
  final double percentage;
}

enum TipOrientation {
  left,
  right;
}

class BubbleBoxTip {

  const BubbleBoxTip({
    this.position = TipPosition.center,
    this.orientation = TipOrientation.right,
  });
  final TipPosition position;
  final TipOrientation orientation;
}
