// Helper Class: BoxShadow (for shadow effects)
class BoxShadow {
  final double offsetX, offsetY, blurRadius, spreadRadius;
  final String color;

  const BoxShadow({
    required this.offsetX,
    required this.offsetY,
    required this.blurRadius,
    required this.spreadRadius,
    required this.color,
  });

  String get cssValue =>
      '$offsetX}px $offsetY}px $blurRadius}px $spreadRadius}px $color';
}