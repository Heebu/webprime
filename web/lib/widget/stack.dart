import 'dart:html';
import '../core/component.dart';
import '../core/stateless_component.dart';

class Stack extends StatelessComponent {
  final List<Widget> children;
  final StackAlignment alignment;
  final StackClip clipBehavior;

  Stack({
    required this.children,
    this.alignment = StackAlignment.topLeft,
    this.clipBehavior = StackClip.none,
  });

  @override
  Element build() {
    final stack = DivElement()
      ..style.position = 'relative'
      ..style.display = 'flex'
      ..style.overflow = clipBehavior == StackClip.none ? 'visible' : 'hidden';

    for (final child in children) {
      final childElement = child.build();
      childElement.style.position = 'absolute';

      // Apply default alignment if not explicitly positioned
      final alignmentStyles = alignment.cssValue;
      childElement.style
        ..top = alignmentStyles['top']
        ..left = alignmentStyles['left']
        ..right = alignmentStyles['right']
        ..bottom = alignmentStyles['bottom'];

      stack.append(childElement);
    }

    return stack;
  }
}

// Alignment options
enum StackAlignment {
  topLeft,
  topCenter,
  topRight,
  centerLeft,
  center,
  centerRight,
  bottomLeft,
  bottomCenter,
  bottomRight,
}

extension StackAlignmentExtension on StackAlignment {
  Map<String, String> get cssValue {
    switch (this) {
      case StackAlignment.topLeft:
        return {'top': '0', 'left': '0', 'right': 'auto', 'bottom': 'auto'};
      case StackAlignment.topCenter:
        return {'top': '0', 'left': '50%', 'right': 'auto', 'bottom': 'auto', 'transform': 'translateX(-50%)'};
      case StackAlignment.topRight:
        return {'top': '0', 'right': '0', 'left': 'auto', 'bottom': 'auto'};
      case StackAlignment.centerLeft:
        return {'top': '50%', 'left': '0', 'right': 'auto', 'bottom': 'auto', 'transform': 'translateY(-50%)'};
      case StackAlignment.center:
        return {'top': '50%', 'left': '50%', 'right': 'auto', 'bottom': 'auto', 'transform': 'translate(-50%, -50%)'};
      case StackAlignment.centerRight:
        return {'top': '50%', 'right': '0', 'left': 'auto', 'bottom': 'auto', 'transform': 'translateY(-50%)'};
      case StackAlignment.bottomLeft:
        return {'bottom': '0', 'left': '0', 'right': 'auto', 'top': 'auto'};
      case StackAlignment.bottomCenter:
        return {'bottom': '0', 'left': '50%', 'right': 'auto', 'top': 'auto', 'transform': 'translateX(-50%)'};
      case StackAlignment.bottomRight:
        return {'bottom': '0', 'right': '0', 'left': 'auto', 'top': 'auto'};
    }
  }
}

// Clip behavior for Stack
enum StackClip { none, clip }

