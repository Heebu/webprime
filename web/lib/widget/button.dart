import 'dart:html';
import '../core/component.dart';

class Button extends Component {
  final String text;
  final void Function() onPressed;

  Button({required this.text, required this.onPressed});

  @override
  Element build() {
    final button = ButtonElement()
      ..text = text
      ..onClick.listen((_) => onPressed());

    return button; // No need for type casting
  }
}
