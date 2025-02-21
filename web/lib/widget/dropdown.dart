import 'dart:html';
import '../core/stateful_component.dart';

class Dropdown<T> extends StatefulComponent {
  final List<T> items;
  final T? initialValue;
  final void Function(T?)? onChanged;
  final String backgroundColor;
  final String textColor;
  final String border;
  final double padding;
  final double borderRadius;

  Dropdown({
    required this.items,
    this.initialValue,
    this.onChanged,
    this.backgroundColor = 'white',
    this.textColor = 'black',
    this.border = '1px solid #ccc',
    this.padding = 8,
    this.borderRadius = 5,
  });

  @override
  State<Dropdown<T>> createState() => _DropdownState<T>();
}

class _DropdownState<T> extends State<Dropdown<T>> {
  T? selectedValue;

  void initState() {
    selectedValue = component.initialValue;
  }

  @override
  Element build() {
    final selectElement = SelectElement()
      ..style.backgroundColor = component.backgroundColor
      ..style.color = component.textColor
      ..style.border = component.border
      ..style.padding = '${component.padding}px'
      ..style.borderRadius = '${component.borderRadius}px';

    // Populate dropdown options
    for (T item in component.items) {
      final option = OptionElement()
        ..value = item.toString()
        ..text = item.toString();

      if (item == selectedValue) {
        option.selected = true;
      }

      selectElement.children.add(option);
    }

    // Handle selection change
    selectElement.onChange.listen((event) {
      selectedValue = selectElement.value as T;
      setState(() {
        if (component.onChanged != null) {
          component.onChanged!(selectedValue);
        }
      });
    });

    return selectElement;
  }
}
