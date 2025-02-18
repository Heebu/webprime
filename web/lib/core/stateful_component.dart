import 'dart:html';
import 'component.dart';

abstract class StatefulComponent extends Component {
  late final State<StatefulComponent> _state;

  StatefulComponent() {
    _state = createState();
    _state._component = this; // Link state to the component
  }

  State<StatefulComponent> createState();

  @override
  Element build() => _state.build();

  void setState(void Function() fn) {
    fn();
    update();
  }
}

abstract class State<T extends StatefulComponent> {
  late T _component;

  T get component => _component;

  /// Called when the component needs to be rebuilt.
  Element build();
}
