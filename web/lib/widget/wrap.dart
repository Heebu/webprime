import 'dart:html';
import '../core/component.dart';
import '../helper/alignment.dart';
import '../core/stateless_component.dart';

class Wrap extends StatelessComponent {
  final List<Widget> children;
  final Axis direction;
  final double spacing;
  final double runSpacing;
  final Alignment alignment;
  final Alignment crossAxisAlignment;

  Wrap({
    required this.children,
    this.direction = Axis.horizontal,
    this.spacing = 0.0,
    this.runSpacing = 0.0,
    this.alignment = Alignment.start,
    this.crossAxisAlignment = Alignment.start,
  });

  @override
  Element build() {
    final wrap = DivElement()
      ..style.display = 'flex'
      ..style.flexWrap = 'wrap'
      ..style.gap = '${runSpacing}px ${spacing}px'
      ..style.justifyContent = alignment.cssValue
      ..style.alignItems = crossAxisAlignment.cssValue
      ..style.flexDirection = direction == Axis.horizontal ? 'row' : 'column';

    for (final child in children) {
      wrap.append(child.build());
    }

    return wrap;
  }
}

// Enums for alignment and axis
enum Axis { horizontal, vertical }



