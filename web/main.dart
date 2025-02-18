import 'lib/widget/text.dart';
import 'lib/core/app.dart';
import 'lib/core/component.dart';
import 'lib/widget/container.dart';
import 'lib/widget/column.dart';
import 'lib/widget/row.dart';

void main() {runApp(myWidget());}

Component myWidget(){
  return Container(
      color: '#ed0b0b',
      child: Column(children: [
    Text('Hello Idris Adedeji'),
    Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Text('Go Hard'),
      Text('Stop'),
    ]),
  ])
  );
}

