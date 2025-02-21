import 'dart:html';
import '../core/component.dart';
import '../helper/edgeinsets.dart';

class TextField extends Widget {
  final String? placeholder;
  final bool obscureText;
  final bool readOnly;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController? controller;
  final TextAlign textAlign;
  final String border;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final String backgroundColor;
  final String textColor;

  TextField({
    this.placeholder,
    this.obscureText = false,
    this.readOnly = false,
    this.maxLength = 10*10000,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.textAlign = TextAlign.left,
    this.border = '1px solid #ccc',
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.all(5),
    this.backgroundColor = 'white',
    this.textColor = 'black',
  });

  @override
  Element build() {
    final input = InputElement()
      ..placeholder = placeholder ?? ''
      ..readOnly = readOnly
      ..maxLength = maxLength ?? -1
      ..style.border = border
      ..style.backgroundColor = backgroundColor
      ..style.color = textColor
      ..style.textAlign = textAlign.toString().split('.').last
      ..type = obscureText ? 'password' : 'text';

    // Set initial value from controller
    if (controller != null) {
      input.value = controller!.text;
      controller!.addListener(() {
        input.value = controller!.text;
      });
    }

    // Apply padding & margin
    padding.applyToStyle(input.style);
    margin.applyToStyle(input.style);

    // Handle input changes
    input.onInput.listen((event) {
      if (onChanged != null) {
        onChanged!(input.value ?? '');
      }
      if (controller != null) {
        controller!.text = input.value ?? '';
      }
    });

    // Handle Enter key press
    input.onKeyDown.listen((event) {
      if (event.key == 'Enter' && onSubmitted != null) {
        onSubmitted!(input.value ?? '');
      }
    });

    return input;
  }
}

/// Text Alignment Enum
enum TextAlign { left, center, right }

/// Controller for managing text input
class TextEditingController {
  String text;
  final List<void Function()> _listeners = [];

  TextEditingController({this.text = ''});

  void addListener(void Function() listener) {
    _listeners.add(listener);
  }

  void notifyListeners() {
    for (var listener in _listeners) {
      listener();
    }
  }

  set textValue(String newText) {
    text = newText;
    notifyListeners();
  }
}
