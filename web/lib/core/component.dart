// import 'package:web/helpers.dart';
//
// abstract class Component {
//   /// Renders the component to a DOM element.
//   Element build();
//
//   /// Updates the DOM when state changes.
//   void update() {
//     final newElement = build();
//     _element?.replaceWith(newElement);
//     _element = newElement;
//   }
//
//   Element? _element;
// }
//


import 'dart:html';

abstract class Widget {
  /// Stores the currently rendered element.
  Element? _element;

  /// Renders the component to a DOM element.
  Element build();

  /// Gets the rendered element, ensuring it is built once.
  Element get element {
    _element ??= build();
    return _element!;
  }

  /// Updates the DOM when state changes.
  void update() {
    final newElement = build();
    if (_element != null && _element!.parent != null) {
      _element!.replaceWith(newElement); // ✅ Correctly replace old element
    }
    _element = newElement;
  }
}


// abstract class Component {
//   Element build();
//
//   void update() {
//     final newElement = build();
//     if (_element != null && _element!.parent != null) {
//       _element!.replaceWith(newElement); // ✅ Correctly replace old element
//     }
//     _element = newElement;
//   }
//
//   Element? _element;
// }
