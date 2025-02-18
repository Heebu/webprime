import 'dart:html';
import '../core/component.dart';

class Text extends Component {
  final String data;
  final String? style;

  Text(this.data, {this.style});

  @override
  Element build() {
    final element = ParagraphElement()..text = data;

    // Apply styles only if provided
    if (style != null && style!.isNotEmpty) {
      element.style.cssText = '${element.style.cssText} $style';
    }

    return element;
  }
}
