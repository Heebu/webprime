import 'dart:html';
import 'component.dart';

abstract class StatelessComponent extends Widget {
  @override
  Element build();

  void setState(void Function() fn) {
    throw UnsupportedError("StatelessComponent cannot call setState().");
  }
}
