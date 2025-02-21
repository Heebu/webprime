import 'dart:html';
import '../core/component.dart';
import '../helper/edgeinsets.dart';

class Button extends Widget {
  final String text;
  final void Function()? onPressed;
  final String backgroundColor;
  final String textColor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double borderRadius;
  final String border;
  final bool disabled;
  final String hoverColor;
  final String width;
  final String height;

  Button({
    required this.text,
    this.onPressed,
    this.backgroundColor = 'blue',
    this.textColor = 'white',
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.borderRadius = 5,
    this.border = 'none',
    this.disabled = false,
    this.hoverColor = 'darkblue',
    this.width = 'auto',
    this.height = 'auto',
  });

  @override
  Element build() {
    final button = ButtonElement()
      ..text = text
      ..style.backgroundColor = disabled ? '#b0b0b0' : backgroundColor
      ..style.color = textColor
      ..style.padding = '${padding}px'
      ..style.margin = '${margin}px'
      ..style.borderRadius = '${borderRadius}px'
      ..style.border = border
      ..style.cursor = disabled ? 'not-allowed' : 'pointer'
      ..style.width = width
      ..style.height = height
      ..disabled = disabled;

    // Add hover effect
    button.onMouseEnter.listen((_) {
      if (!disabled) button.style.backgroundColor = hoverColor;
    });
    button.onMouseLeave.listen((_) {
      if (!disabled) button.style.backgroundColor = backgroundColor;
    });

    // Handle click
    if (onPressed != null) {
      button.onClick.listen((_) {
        print('Button clicked!');
        onPressed!();
      });
    }

    return button;
  }
}
