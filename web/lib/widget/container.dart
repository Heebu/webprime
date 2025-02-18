import 'dart:html';
import '../core/component.dart';
import '../core/stateless_component.dart';

class Container extends StatelessComponent {
  final Component? child;
  final String? color;
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxDecoration decoration;

  Container({
    this.child,
    this.color,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.decoration = const BoxDecoration(),
  });

  @override
  Element build() {
    final container = DivElement();

    // Apply styles
    final styles = <String, String>{};

    if (color != null) styles['background-color'] = color!;
    if (width != null) styles['width'] = '${width}px';
    if (height != null) styles['height'] = '${height}px';

    // Apply margin and padding separately
    margin.applyMargin(container.style);
    padding.applyPadding(container.style);
    decoration.applyToStyle(container.style);

    // Add child
    if (child != null) {
      container.append(child!.build());
    }

    container.style.cssText = styles.entries.map((e) => '${e.key}: ${e.value};').join(' ');

    return container;
  }
}

// Helper Classes for Styling
class EdgeInsets {
  final double top;
  final double right;
  final double bottom;
  final double left;

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

  void applyMargin(CssStyleDeclaration style) {
    style.marginTop = '${top}px';
    style.marginRight = '${right}px';
    style.marginBottom = '${bottom}px';
    style.marginLeft = '${left}px';
  }

  void applyPadding(CssStyleDeclaration style) {
    style.paddingTop = '${top}px';
    style.paddingRight = '${right}px';
    style.paddingBottom = '${bottom}px';
    style.paddingLeft = '${left}px';
  }
}

class BoxDecoration {
  final String? color;
  final double borderRadius;
  final String border;

  const BoxDecoration({
    this.color,
    this.borderRadius = 0,
    this.border = '',
  });

  void applyToStyle(CssStyleDeclaration style) {
    if (color != null) style.backgroundColor = color!;
    if (borderRadius > 0) style.borderRadius = '${borderRadius}px';
    if (border.isNotEmpty) style.border = border;
  }
}
