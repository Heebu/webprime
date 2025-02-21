import 'dart:html';
import 'box_shadow.dart';

class BoxDecoration {
  final String? color;
  final String? backgroundImage;
  final BorderRadius borderRadius;
  final String border;
  final List<BoxShadow> boxShadow;

  const BoxDecoration({
    this.color,
    this.backgroundImage,
    this.borderRadius = BorderRadius.zero,
    this.border = 'none',
    this.boxShadow = const [],
  });

  void applyToStyle(CssStyleDeclaration style) {
    if (color != null) style.backgroundColor = color!;
    if (backgroundImage != null) style.backgroundImage = 'url($backgroundImage)';
    style.border = border;
    borderRadius.applyToStyle(style); // ✅ Fix: Apply correct border-radius styles
    if (boxShadow.isNotEmpty) {
      style.boxShadow = boxShadow.map((s) => s.cssValue).join(', ');
    }
  }
}

class BorderRadius {
  final double topLeft;
  final double topRight;
  final double bottomLeft;
  final double bottomRight;

  const BorderRadius.all(double radius)
      : topLeft = radius,
        topRight = radius,
        bottomLeft = radius,
        bottomRight = radius;

  const BorderRadius.only({
    this.topLeft = 0,
    this.topRight = 0,
    this.bottomLeft = 0,
    this.bottomRight = 0,
  });

  const BorderRadius.circular(double radius)
      : topLeft = radius,
        topRight = radius,
        bottomLeft = radius,
        bottomRight = radius;

  static const BorderRadius zero = BorderRadius.all(0);

  String get cssValue =>
      '${topLeft}px ${topRight}px ${bottomRight}px ${bottomLeft}px';

  void applyToStyle(CssStyleDeclaration style) {
    style.borderRadius = cssValue;
  }
}

