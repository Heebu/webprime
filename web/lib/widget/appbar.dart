import 'dart:html';
import '../core/component.dart';

class AppBar extends Widget {
  final String title;
  final List<Widget> actions;
  final Widget? leading;
  final String backgroundColor;
  final double elevation;
  final bool centerTitle;

  AppBar({
    required this.title,
    this.actions = const [],
    this.leading,
    this.backgroundColor = 'white',
    this.elevation = 4.0,
    this.centerTitle = false,
  });

  @override
  Element build() {
    final appBar = DivElement()
      ..style.display = 'flex'
      ..style.justifyContent = centerTitle ? 'center' : 'space-between'
      ..style.alignItems = 'center'
      ..style.padding = '10px 16px'
      ..style.backgroundColor = backgroundColor
      ..style.boxShadow = elevation > 0 ? '0px ${elevation}px 10px rgba(0, 0, 0, 0.1)' : 'none';

    document.text = title;

    // Left side (leading widget)
    final leftContainer = DivElement();
    if (leading != null) leftContainer.append(leading!.build());

    // Title
    final titleElement = HeadingElement.h1()
      ..text = title
      ..style.margin = '0'
      ..style.fontSize = '20px'
      ..style.fontWeight = 'bold';

    // Right side (actions)
    final actionsContainer = DivElement()..style.display = 'flex';
    for (var action in actions) {
      actionsContainer.append(action.build());
    }

    appBar.append(leftContainer);
    appBar.append(titleElement);
    appBar.append(actionsContainer);

    return appBar;
  }
}
