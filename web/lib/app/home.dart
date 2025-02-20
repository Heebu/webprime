import 'dart:html';
import '../core/stateful_component.dart';
import '../widget/container.dart';
import '../widget/scaffold.dart';
import '../widget/column.dart';
import '../widget/text.dart';
import '../widget/button.dart';
import '../widget/row.dart';
import '../helper/alignment.dart';
import '../helper/edgeinsets.dart';
import '../helper/box_decoration.dart';
import '../assets/color.dart';


class CounterPage extends StatefulComponent {
  @override
  State<StatefulComponent> createState() => _CounterState();
}

class _CounterState extends State<CounterPage> {
  int count = 0;

  addCount(){
    setState((){
      count++;
    });
  }

  subCount(){
    setState((){
      count--;
    });
  }

  @override
  Element build() {
    return Scaffold(
      appBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.green.shade400,
        ),
        padding: EdgeInsets.all(10),
        child: Text('Counter App', style: TextStyle(
          color: Colors.red.shade400
        )),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text('Count: $count', style: TextStyle(
                color: Colors.white,
              )),
            ),
           Container(
             padding: EdgeInsets.only(top: 20),
             margin: EdgeInsets.only(top: 100),
             width: 200, height: 100,
             decoration: BoxDecoration(color: Colors.white),
             child:  Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Button(
                   text: 'Increment',
                   backgroundColor: Colors.pink.toString(),
                   margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                   textColor: Colors.white,
                   onPressed: () {
                     addCount();
                   },
                 ),
                 Button(
                   text: 'Decrement',
                   backgroundColor: Colors.pink.toString(),
                   padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                   textColor: Colors.white,
                   onPressed: () {
                     subCount();
                   },
                 ),
               ]
             ),
           ),
          ],
        ),
      ),
      bottomBar: Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.green.shade500),
        child: Text('Footer Section', style: TextStyle(color: Colors.black, )),
      ),
      backgroundColor: Colors.black,
      padding: EdgeInsets.all(20),
    ).build();
  }
}
