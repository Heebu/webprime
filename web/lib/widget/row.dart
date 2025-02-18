import 'dart:html';
import '../core/component.dart';

class Row extends Component {
  final List<Component> children;
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

// Alignment Enums (similar to Flutter)
enum MainAxisAlignment {
  start,
  end,
  center,
  spaceBetween,
  spaceAround,
}

enum CrossAxisAlignment {
  start,
  end,
  center,
  stretch,
}

// Extension to convert enums to CSS values
extension MainAxisAlignmentExtension on MainAxisAlignment {
  String get cssValue {
    switch (this) {
      case MainAxisAlignment.start:
        return 'flex-start';
      case MainAxisAlignment.end:
        return 'flex-end';
      case MainAxisAlignment.center:
        return 'center';
      case MainAxisAlignment.spaceBetween:
        return 'space-between';
      case MainAxisAlignment.spaceAround:
        return 'space-around';
    }
  }
}

extension CrossAxisAlignmentExtension on CrossAxisAlignment {
  String get cssValue {
    switch (this) {
      case CrossAxisAlignment.start:
        return 'flex-start';
      case CrossAxisAlignment.end:
        return 'flex-end';
      case CrossAxisAlignment.center:
        return 'center';
      case CrossAxisAlignment.stretch:
        return 'stretch';
    }
  }
}
