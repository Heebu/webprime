import 'dart:html';
import '../core/component.dart';
import '../core/stateless_component.dart';

class Positioned extends StatelessComponent {
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final Widget child;

  Positioned({
    this.top,
    this.right,
    this.bottom,
    this.left,
    required this.child,
  });

  @override
  Element build() {
    final element = child.build();
    element.style.position = 'absolute';

    if (top != null) element.style.top = '${top}px';
    if (right != null) element.style.right = '${right}px';
    if (bottom != null) element.style.bottom = '${bottom}px';
    if (left != null) element.style.left = '${left}px';

    return element;
  }
}
