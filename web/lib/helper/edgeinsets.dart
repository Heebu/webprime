// Helper Classes for Styling
import 'dart:html';


class EdgeInsets {
  final double top, right, bottom, left;

  const EdgeInsets.all(double value)
      : top = value,
        right = value,
        bottom = value,
        left = value;

  const EdgeInsets.symmetric({double vertical = 0, double horizontal = 0})
      : top = vertical,
        right = horizontal,
        bottom = vertical,
        left = horizontal;

  const EdgeInsets.only({
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.left = 0,
  });

  static const EdgeInsets zero = EdgeInsets.all(0);

  void applyToStyle(CssStyleDeclaration style) {
    style.margin = '$top}px $right}px $bottom}px $left}px';
    style.padding = '$top}px $right}px $bottom}px $left}px';
  }
}