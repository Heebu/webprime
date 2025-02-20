import 'dart:html';
import 'component.dart';

abstract class StatefulComponent extends Widget {
  late final State<StatefulComponent> _state;
  Element? _currentElement; // Track the current element

  StatefulComponent() {
    _state = createState();
    _state._component = this;
  }

  State<StatefulComponent> createState();

  @override
  Element build() {
    _currentElement = _state.build();
    return _currentElement!;
  }

  void setState(void Function() fn) {
    fn(); // Apply state changes
    update(); // Rebuild UI
  }

  void update() {
    if (_currentElement != null) {
      final newElement = build();
      _currentElement!.replaceWith(newElement); // Replace old element
      _currentElement = newElement;
    }
  }
}

abstract class State<T extends StatefulComponent> {
  late T _component;

  T get component => _component;

  /// Called when the component needs to be rebuilt.
  Element build();

  void setState(void Function() fn) {
    fn(); // Modify state
    component.update(); // Ensure UI updates
  }
}
