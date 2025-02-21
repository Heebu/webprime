import 'dart:html';
import '../core/component.dart';
import '../core/stateless_component.dart';

class Align extends StatelessComponent {
  final Alignment alignment;
  final Widget child;

  Align({required this.alignment, required this.child});

  @override
  Element build() {
    final element = DivElement()
      ..style.display = 'flex'
      ..style.position = 'absolute'
      ..style.justifyContent = alignment.horizontal
      ..style.alignItems = alignment.vertical
      ..append(child.build());

    return element;
  }
}

// Alignment Enum
enum Alignment {
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

extension AlignmentExtension on Alignment {
  String get horizontal {
    switch (this) {
      case Alignment.topLeft:
      case Alignment.centerLeft:
      case Alignment.bottomLeft:
        return 'flex-start';
      case Alignment.topCenter:
      case Alignment.center:
      case Alignment.bottomCenter:
        return 'center';
      case Alignment.topRight:
      case Alignment.centerRight:
      case Alignment.bottomRight:
        return 'flex-end';
    }
  }

  String get vertical {
    switch (this) {
      case Alignment.topLeft:
      case Alignment.topCenter:
      case Alignment.topRight:
        return 'flex-start';
      case Alignment.centerLeft:
      case Alignment.center:
      case Alignment.centerRight:
        return 'center';
      case Alignment.bottomLeft:
      case Alignment.bottomCenter:
      case Alignment.bottomRight:
        return 'flex-end';
    }
  }
}
