import 'dart:html';
import '../core/component.dart';
import '../helper/alignment.dart';

class Column extends Widget {
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String? style;
  final double gap;
  final bool scrollable;

  Column({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.style,
    this.gap = 0,
    this.scrollable = false,
  });

  @override
  Element build() {
    final column = DivElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.justifyContent = mainAxisAlignment.cssValue
      ..style.alignItems = crossAxisAlignment.cssValue;

    if (scrollable) {
      column.style.overflowY = 'auto';
      column.style.maxHeight = '100vh';
    }

    if (style != null) column.style.cssText! + style!;

    for (var i = 0; i < children.length; i++) {
      final childElement = children[i].build();
      column.append(childElement);

      if (gap > 0 && i < children.length - 1) {
        column.append(DivElement()..style.height = '${gap}px');
      }
    }

    return column;
  }
}

