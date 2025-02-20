import 'dart:html';
import '../core/component.dart';
import '../helper/edgeinsets.dart';

class Scaffold extends Widget {
  final Widget? appBar;
  final Widget body;
  final Widget? bottomBar;
  final String? backgroundColor;
  final EdgeInsets padding;

  Scaffold({
    this.appBar,
    required this.body,
    this.bottomBar,
    this.backgroundColor,
    this.padding = EdgeInsets.zero,
  });

  @override
  Element build() {
    final scaffold = DivElement()
      ..style.display = 'flex'
      ..style.flexDirection = 'column'
      ..style.width = '100vw'
      ..style.minHeight = '100vh'
      ..style.boxSizing = 'border-box';

    if (backgroundColor != null) scaffold.style.backgroundColor = backgroundColor!;
    padding.applyToStyle(scaffold.style);

    // Add AppBar (if any)
    if (appBar != null) scaffold.append(appBar!.build());

    // Body Wrapper (Flexible)
    final bodyWrapper = DivElement()
      ..style.flex = '1'
      ..append(body.build());

    scaffold.append(bodyWrapper);

    // Add Bottom Bar (if any)
    if (bottomBar != null) scaffold.append(bottomBar!.build());

    return scaffold;
  }
}
