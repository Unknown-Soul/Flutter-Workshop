//import 'dart:html';


//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(   //Material app is  google root widget design
    home: Home(),
   // home: Text('hey ram'), // home , text are also widget
  ));
}

//Hotreload : stateless widget's
/*
widgets tht cannot change overtime is stateless widgets
widgets that can be change overtime are stateful widgets
* */

/*Home Widget*/
// // Home widget
// class Home extends StatelessWidget { // snippet stateless and tab
//   @override // means we need to use build rather than statelessWidget
//   Widget build(BuildContext context) {
//     return Scaffold( // so whenever we make changes in stateless widget flutter automatically hot reload only part that we have changed
//      // body: Center(
//         // child :[ Text('This is Ashutosh'),  // child specific that text is child property of center property
//         /*child : Image(  // Image.asset() will also work
//           //image: NetworkImage('https://th.bing.com/th/id/OIP.2SeNJe1eMMnofrYp0zYMOgHaEK?w=289&h=180&c=7&o=5&dpr=1.25&pid=1.7'),
//           image: AssetImage('assets/First.jpg'),
//         )*/
//         /*child: Icon(
//           Icons.airline_seat_flat,
//           color: Colors.black,
//           size: 50,
//         )*/
//       //   child: RaisedButton.icon(
//       //     onPressed: (){},
//       //     icon : Icon(
//       //       Icons.mail
//       //     ),
//       //     label : Text("Mail"),
//       //     color: Colors.amber,
//       // ),
//       //   child: IconButton(  // Icon is clickable
//       //     onPressed: (){},
//       //     icon: Icon(Icons.alarm),
//       //     color: Colors.amber,
//       //     iconSize: 100,
//       //   ),
//
//      // ),
//       /*Comment below section*/
//       /* Containers & Padding*/
//       // body: Container(
//       //   color: Colors.grey[400],// if dont have child apply to whole screen else only to child
//       //   padding: EdgeInsets.all(50), // around the text padding is of 20 from all the side
//       //   margin: EdgeInsets.all(50),   // margin of the child
//       //   child: Text('Hello'),
//       // ),
//       appBar: AppBar(
//             title: Text(
//               'my first app',
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.bold, //   Font weight is object of font weight same with color
//                 color : Colors.black,
//                 fontFamily: 'IndieFlower', // which I have declared in pubpsec.yaml
//               ),
//             ),
//             centerTitle: true,  // center title is a property
//             backgroundColor: Colors.red[900],
//           ),
//           body: Padding(
//             padding: EdgeInsets.all(90.0),
//             child: Text('Hello'),
//           ),
//           floatingActionButton: FloatingActionButton( // FloatingActionButton() widget and FloatingActionButton properties
//             onPressed: (){
//               print('You click me and I am going to be showed on console');
//             },
//             child: Text('Click'),
//             backgroundColor: Colors.red[900],
//           ),
//       );
//   }
// }


// Home widget

// Rows and Columns

//rows and columns
/*Rows and Columns*/
// class Home extends StatelessWidget { // snippet stateless and tab
//   @override // means we need to use build rather than statelessWidget
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'my first app',
//           style: TextStyle(
//             fontSize: 30,
//             fontWeight: FontWeight.bold, //   Font weight is object of font weight same with color
//             color : Colors.black,
//             fontFamily: 'IndieFlower', // which I have declared in pubpsec.yaml
//           ),
//         ),
//         centerTitle: true,  // center title is a property
//         backgroundColor: Colors.red[900],
//       ),
//       /* Comment below of row*/
//       // body: Row(
//       //   mainAxisAlignment: MainAxisAlignment.spaceAround, // main-axis : horizontal,
//       //   crossAxisAlignment: CrossAxisAlignment.start, //  cross-axis : vertical
//       //   children: [
//       //     Text('Hellow Word'),
//       //     FlatButton(onPressed: (){},
//       //                 color: Colors.amber,
//       //                child: Text('Click me')),
//       //     Container(
//       //       color: Colors.cyan,
//       //       padding: EdgeInsets.all(40.0),
//       //       child: Text('insider container'),
//       //     )
//       //   ],
//       // ),
//       /*This is commented*/
//       /*Columns*/
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly, // mainAxisAlignment for column is vertical
//                 crossAxisAlignment: CrossAxisAlignment.stretch, //crossAxisAlignment for column is horizontal
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('Hellow'),
//                       Text('World'),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       padding: EdgeInsets.all(50.0),
//                       color: Colors.red,
//                       child: Text("Container1"),
//                     ),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(50.0),
//                     color: Colors.cyan,
//                     child: Text("Container2"),
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(50.0),
//                     color: Colors.amber,
//                     child: Text("Container3"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton( // FloatingActionButton() widget and FloatingActionButton properties
//         onPressed: (){
//           print('You click me and I am going to be showed on console');
//         },
//         child: Text('Click'),
//         backgroundColor: Colors.red[900],
//       ),
//     );
//   }
// }



/*Expand Widget*/
class Home extends StatelessWidget { // snippet stateless and tab
  @override // means we need to use build rather than statelessWidget
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my first app',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold, //   Font weight is object of font weight same with color
            color : Colors.black,
            fontFamily: 'IndieFlower', // which I have declared in pubpsec.yaml
          ),
        ),
        centerTitle: true,  // center title is a property
        backgroundColor: Colors.red[900],
      ),
      body: Row(
        children: [
          Expanded(child: Image.asset('assets/First.jpg')),
          Expanded(
            flex: 3, // give 3 portion to width to this continer
            child: Container(padding: EdgeInsets.all(50.0),
                      color: Colors.pink,
                      child: Text('1')),
          ),
          Expanded(
            flex: 2,
            child: Container(padding: EdgeInsets.all(50.0),
                color: Colors.yellowAccent,
                child: Text('2')),
          ),
          Expanded(
            flex: 1,
            child: Container(padding: EdgeInsets.all(50.0),
                color: Colors.blue,
                child: Text('3')),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton( // FloatingActionButton() widget and FloatingActionButton properties
        onPressed: (){
          print('You click me and I am going to be showed on console');
        },
        child: Text('Click'),
        backgroundColor: Colors.red[900],
      ),
    );
  }
}
