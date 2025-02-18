import 'dart:html';
import '../core/component.dart';

class Column extends Component {
  final List<Component> children;
  final String? style;

  Column({required this.children, this.style});

  @override
  Element build() {
    final column = DivElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'column';

    // If additional styles are provided, append them.
    if (style != null && style!.isNotEmpty) {
      column.style.cssText = '${column.style.cssText} $style';
    }

    // Build and append each child component.
    for (final child in children) {
      column.append(child.build());
    }
    return column;
  }
}
