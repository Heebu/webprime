import 'dart:html';

class Border {
  final String color;
  final double width;
  final String style;
  final bool applyToAllSides;
  final double top;
  final double right;
  final double bottom;
  final double left;

  const Border({
    this.color = 'black',
    this.width = 1.0,
    this.style = 'solid',
    this.applyToAllSides = true,
    this.top = 1.0,
    this.right = 1.0,
    this.bottom = 1.0,
    this.left = 1.0,
  });

  /// Applies the border styles to an element
  void applyToStyle(CssStyleDeclaration style) {
    if (applyToAllSides) {
      style.border = '$width}px $style $color';
    } else {
      style.borderTop = '$top}px $style $color';
      style.borderRight = '$right}px $style $color';
      style.borderBottom = '$bottom}px $style $color';
      style.borderLeft = '$left}px $style $color';
    }
  }
}
