import 'dart:html';
import '../core/stateless_component.dart';
import '../core/component.dart';
import '../helper/edgeinsets.dart';
import '../helper/box_decoration.dart';
import '../helper/alignment.dart';


class Container extends StatelessComponent {
  final Widget? child;
  final double? width;
  final double? height;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final BoxDecoration decoration;
  final Alignment alignment;

  Container({
    this.child,
    this.width,
    this.height,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.decoration = const BoxDecoration(),
    this.alignment = Alignment.center,
  });

  @override
  Element build() {
    final div = DivElement();

    // Set Size
    if (width != null) div.style.width = '${width}px';
    if (height != null) div.style.height = '${height}px';

    // Apply Styling
    margin.applyToStyle(div.style);
    padding.applyToStyle(div.style);
    decoration.applyToStyle(div.style);
    div.style.display = 'flex';
    div.style.justifyContent = alignment.cssValue;
    div.style.alignItems = 'center';

    // Append child if present
    if (child != null) {
      div.append(child!.build());
    }

    return div;
  }
}











