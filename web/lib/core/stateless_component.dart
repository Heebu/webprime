import 'dart:html';
import 'component.dart';

abstract class StatelessComponent extends Component {
  @override
  Element build();

  void setState(void Function() fn) {
    throw UnsupportedError("StatelessComponent cannot call setState().");
  }
}
