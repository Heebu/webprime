import 'dart:html';
import '../core/component.dart';
import '../core/stateless_component.dart';
import '../helper/edgeinsets.dart';


class Padding extends StatelessComponent {
  final EdgeInsets padding;
  final Widget? child;


  Padding({
    required this.padding,
    this.child,
  });

  @override
  Element build() {
    final container = DivElement();



    padding.applyToStyle(container.style);

    // Add child
    if (child != null) {
      container.append(child!.build());
    }

    return container;
  }
}

