import 'dart:html';
import '../core/component.dart';

class GestureDetector extends Widget {
  final Widget child;
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onRightClick;
  final void Function()? onHover;
  final void Function()? onLongPress;
  final void Function()? onMouseEnter;
  final void Function()? onMouseLeave;

  GestureDetector({
    required this.child,
    this.onTap,
    this.onDoubleTap,
    this.onRightClick,
    this.onHover,
    this.onLongPress,
    this.onMouseEnter,
    this.onMouseLeave,
  });

  @override
  Element build() {
    final wrapper = DivElement()..style.display = 'inline-block';

    final childElement = child.build();
    wrapper.append(childElement);

    if (onTap != null) {
      wrapper.onClick.listen((event) => onTap!());
    }
    if (onDoubleTap != null) {
      wrapper.onDoubleClick.listen((event) => onDoubleTap!());
    }
    if (onRightClick != null) {
      wrapper.onContextMenu.listen((event) {
        event.preventDefault();
        onRightClick!();
      });
    }
    if (onHover != null) {
      wrapper.onMouseOver.listen((event) => onHover!());
    }
    if (onLongPress != null) {
      wrapper.onMouseDown.listen((event) {
        if (event.button == 0) { // Left-click
          Future.delayed(Duration(milliseconds: 500), () {
            if (event.buttons == 1) onLongPress!();
          });
        }
      });
    }
    if (onMouseEnter != null) {
      wrapper.onMouseEnter.listen((event) => onMouseEnter!());
    }
    if (onMouseLeave != null) {
      wrapper.onMouseLeave.listen((event) => onMouseLeave!());
    }

    return wrapper;
  }
}
