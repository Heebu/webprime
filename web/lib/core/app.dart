import 'dart:html'; // For Element and querying DOM
import 'component.dart';

void runApp(Widget rootComponent,) {
  // Find the mount point in the HTML
  final mountPoint = document.getElementById('app')!;

  // Clear existing children
  mountPoint.children.clear();

  // Build the root component and append it
  final rootElement = rootComponent.build();
  mountPoint.append(rootElement);
}