import 'dart:html';
import '../core/component.dart';
import '../helper/page_controller.dart';

class PageView extends Widget {
  final List<Widget> children;
  final PageController controller;
  final bool scrollDirection; // false = horizontal, true = vertical
  final void Function(int)? onPageChanged;

  PageView({
    required this.children,
    required this.controller,
    this.scrollDirection = false,
    this.onPageChanged,
  });

  @override
  Element build() {
    final container = DivElement()
      ..style.overflow = 'hidden'
      ..style.display = 'flex'
      ..style.flexDirection = scrollDirection ? 'column' : 'row'
      ..style.width = '100%'
      ..style.height = '100%';

    for (var i = 0; i < children.length; i++) {
      final page = children[i].build()
        ..style.flexShrink = '0'
        ..style.width = '100%'
        ..style.height = '100%';

      container.append(page);
    }

    controller.addListener((index) {
      final offset = index * 100;
      container.style.transform =
      scrollDirection ? 'translateY(-$offset%)' : 'translateX(-$offset%)';
      onPageChanged?.call(index);
    });

    return container;
  }
}
