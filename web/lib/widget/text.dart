import 'dart:html';
import '../core/component.dart';

class Text extends Widget {
  final String data;
  final TextStyle style;
  final TextAlign textAlign;

  Text(this.data, {this.style = const TextStyle(), this.textAlign = TextAlign.left});

  @override
  Element build() {
    final textElement = ParagraphElement()..text = data;

    // Apply styles
    textElement.style
      ..color = style.color
      ..fontSize = '${style.fontSize}px'
      ..fontWeight = style.fontWeight
      ..fontFamily = style.fontFamily
      ..textAlign = textAlign.cssValue
      ..textDecoration = style.decoration
      ..lineHeight = '${style.lineHeight}px';

    return textElement;
  }
}

// 📌 `TextStyle` Class for Custom Styling
class TextStyle {
  final String color;
  final double fontSize;
  final String fontWeight;
  final String fontFamily;
  final double lineHeight;
  final String decoration;

  const TextStyle({
    this.color = 'black',
    this.fontSize = 16,
    this.fontWeight = 'normal',
    this.fontFamily = 'Arial, sans-serif',
    this.lineHeight = 1.5,
    this.decoration = 'none',
  });
}

// 📌 `TextAlign`
enum TextAlign { left, center, right, justify }

// 📌 Extension to Convert Enum to CSS Value
extension TextAlignExtension on TextAlign {
  String get cssValue {
    switch (this) {
      case TextAlign.center:
        return 'center';
      case TextAlign.right:
        return 'right';
      case TextAlign.justify:
        return 'justify';
      default:
        return 'left';
    }
  }
}
