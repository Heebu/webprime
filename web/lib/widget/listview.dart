import 'dart:html';
import '../core/component.dart';
import '../core/stateless_component.dart';
import '../helper/edgeinsets.dart';

class ListView extends StatelessComponent {
  final List<Widget>? children;
  final Widget Function(int index)? itemBuilder;
  final int? itemCount;
  final Widget Function(int index)? separatorBuilder;
  final Axis scrollDirection;
  final bool reverse;
  final EdgeInsets padding;
  final double spacing;
  final bool shrinkWrap;

  /// Standard ListView with static children
  ListView({
    required this.children,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.shrinkWrap = false,
  })  : itemBuilder = null,
        itemCount = null,
        separatorBuilder = null;

  /// ListView.builder - Dynamically generated items
  ListView.builder({
    required this.itemCount,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.shrinkWrap = false,
  })  : children = null,
        separatorBuilder = null;

  /// ListView.separated - Items with separators
  ListView.separated({
    required this.itemCount,
    required this.itemBuilder,
    required this.separatorBuilder,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding = EdgeInsets.zero,
    this.spacing = 0,
    this.shrinkWrap = false,
  }) : children = null;

  @override
  Element build() {
    final container = DivElement()
      ..style.display = 'flex'
      ..style.flexDirection =
      scrollDirection == Axis.vertical ? 'column' : 'row'
      ..style.overflowY =
      scrollDirection == Axis.vertical && !shrinkWrap ? 'auto' : 'hidden'
      ..style.overflowX =
      scrollDirection == Axis.horizontal && !shrinkWrap ? 'auto' : 'hidden'
      ..style.gap = '${spacing}px';

    if (reverse) {
      container.style.flexDirection =
      scrollDirection == Axis.vertical ? 'column-reverse' : 'row-reverse';
    }

    padding.applyToStyle(container.style);

    if (children != null) {
      // Standard ListView
      for (final child in children!) {
        container.append(child.build());
      }
    } else if (itemBuilder != null && itemCount != null) {
      // ListView.builder
      for (int i = 0; i < itemCount!; i++) {
        container.append(itemBuilder!(i).build());
      }
    } else if (separatorBuilder != null && itemBuilder != null) {
      // ListView.separated
      for (int i = 0; i < itemCount!; i++) {
        container.append(itemBuilder!(i).build());
        if (i < itemCount! - 1) {
          container.append(separatorBuilder!(i).build());
        }
      }
    }

    return container;
  }
}

// Axis Enum
enum Axis { vertical, horizontal }