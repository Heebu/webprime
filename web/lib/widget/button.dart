import 'dart:html';
import '../core/stateful_component.dart';
import '../helper/edgeinsets.dart';
import '../helper/box_decoration.dart';

class Button extends StatefulComponent {
  final String text;
  final String? backgroundColor;
  final String? textColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final String border;
  final String hoverColor;
  final bool disabled;
  final void Function()? onPressed;

  Button({
    required this.text,
    this.onPressed,
    this.backgroundColor = 'blue',
    this.textColor = 'white',
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.all(10),
    this.borderRadius = const BorderRadius.all(5),
    this.border = 'none',
    this.disabled = false,
    this.hoverColor = 'darkblue',
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPressed = false;

  @override
  Element build() {
    final button = ButtonElement()
      ..text = component.text
      ..style.backgroundColor = component.disabled ? 'gray' : (isPressed ? component.hoverColor : component.backgroundColor!)
      ..style.color = component.textColor
      ..style.border = component.border
      ..style.cursor = component.disabled ? 'not-allowed' : 'pointer'
      ..disabled = component.disabled;

    // Apply padding and border radius
    component.padding.applyToStyle(button.style);
    component.margin.applyToStyle(button.style);
    component.borderRadius.applyToStyle(button.style);

    // Add hover effect
    button.onMouseEnter.listen((_) {
      if (!component.disabled) {
        setState(() {
          isPressed = true;
        });
      }
    });

    button.onMouseLeave.listen((_) {
      if (!component.disabled) {
        setState(() {
          isPressed = false;
        });
      }
    });

    // Handle click
    if (component.onPressed != null) {
      button.onClick.listen((_) {
        setState(() {
          component.onPressed!();
        });
      });
    }

    return button;
  }
}

