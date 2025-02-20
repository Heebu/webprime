import 'dart:html';
import '../core/component.dart';
import '../helper/alignment.dart';


class Row extends Widget {
  final List<Widget> children;
  final String? style;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  Row({
    required this.children,
    this.style,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Element build() {
    final row = DivElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'row'
      ..style.justifyContent = mainAxisAlignment.cssValue
      ..style.alignItems = crossAxisAlignment.cssValue;

    // Apply additional styles without overriding default styles
    if (style != null && style!.isNotEmpty) {
      row.style.cssText != '; $style';
    }

    for (final child in children) {
      row.append(child.build());
    }
    return row;
  }
}

