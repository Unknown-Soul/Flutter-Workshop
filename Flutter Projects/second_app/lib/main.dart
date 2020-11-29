import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: NinjaCard(),
  ));
}

/* stateless widget*/
// class NinjaCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[850],
//       appBar: AppBar(
//         title: Text('Ninja Id Card'),
//         centerTitle: true,
//         backgroundColor: Colors.grey[900],
//         elevation: 0.0,
//       ),
//       body: Padding(
//         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
//         child:  Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//
//           children: [
//             Center(
//               child: CircleAvatar(
//                 backgroundImage: AssetImage('assets/OIP.jpg'),
//                 radius: 40.0,
//               ),
//             ),
//             Divider(
//               height: 90.0,
//               color : Colors.grey[800],
//             ),
//             Text(
//               'Name',
//               style: TextStyle(
//                 color: Colors.grey[200],
//                 letterSpacing: 2.0,
//               ),
//             ),
//             SizedBox(height: 10.0), // add space b/w  2 widget
//             Text(
//               'chun-li',
//               style: TextStyle(
//                 color: Colors.amberAccent[200],
//                 letterSpacing: 2.0,
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height:  30.0),
//             Text(
//               'Current Level',
//               style: TextStyle(
//                 color: Colors.grey[200],
//                 letterSpacing: 2.0,
//               ),
//             ),
//             SizedBox(height: 10.0), // add space b/w  2 widget
//             Text(
//               '20',
//               style: TextStyle(
//                 color: Colors.amberAccent[200],
//                 letterSpacing: 2.0,
//                 fontSize: 28.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 30.0), // add space b/w  2 widget
//             Row(
//               children: [
//                 Icon(
//                   Icons.email,
//                   color: Colors.grey[400],
//                 ),
//                 SizedBox(width: 10.0),
//                 Text(
//                     'thisismail@gmail.com',
//                     style: TextStyle(
//                       color: Colors.grey[400],
//                       fontSize: 19.0,
//                       letterSpacing: 1.0,
//                     ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//

/* stateful widget  used for dynamic data*/
class NinjaCard extends StatefulWidget {
  @override
  _NinjaCardState createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Ninja Id Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //level += 1; // this will not work bcz level is wisget and we need to update its state
          setState(() {
            level += 1; // this will work
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.grey[800],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/OIP.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(
              height: 90.0,
              color : Colors.grey[800],
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.grey[200],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0), // add space b/w  2 widget
            Text(
              'chun-li',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height:  30.0),
            Text(
              'Current Level',
              style: TextStyle(
                color: Colors.grey[200],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0), // add space b/w  2 widget
            Text(
              '$level',
              style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0), // add space b/w  2 widget
            Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                SizedBox(width: 10.0),
                Text(
                  'thisismail@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 19.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}


