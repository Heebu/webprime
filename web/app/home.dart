import 'dart:html';
import '../lib/core/stateful_component.dart';
import '../lib/widget/container.dart';
import '../lib/widget/scaffold.dart';
import '../lib/widget/column.dart';
import '../lib/widget/text.dart';
import '../lib/widget/button.dart';
import '../lib/widget/row.dart';
import '../lib/widget/dropdown.dart';
import '../lib/widget/appbar.dart';
import '../lib/widget/image.dart';
import '../lib/widget/listview.dart';
import '../lib/helper/alignment.dart';
import '../lib/helper/edgeinsets.dart';
import '../lib/helper/box_decoration.dart';
import '../lib/assets/color.dart';
import '../lib/widget/textfield.dart';



class CounterPage extends StatefulComponent {
  int count = 0;

  @override
  State<StatefulComponent> createState() => _CounterState();
}

class _CounterState extends State<CounterPage> {

  addCount(){
    setState((){
     component.count++;
    });
  }

  subCount(){
    setState((){
      component.count++;
    });
  }

  @override
  Element build() {
    return Scaffold(
      appBar: AppBar(title: 'Hello '),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Text('Count: ${component.count}', style: TextStyle(
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
                       print(component.count.toString());
                       addCount();}
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
            Container(
              height: 200, width: 700,
              child: Dropdown(items: ['Text1', 'Text2', 'Text3', 'Text4',], )
            ),

            Container(
              height: 50,
              width: 300,
              child: TextField(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                onChanged: (value) {
                  print(value);
                },
              ),
            ),
            Container(
              height: 250, width: 500,
              decoration: BoxDecoration(color: Colors.orange.shade500),
              child: ListView.builder(itemCount: 4, itemBuilder: (index) {
                return
                ImageWidget(src: 'https://thumbs.dreamstime.com/b/colorful-balloons-7643802.jpg', height: 50, width: 60);
              }, )
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
