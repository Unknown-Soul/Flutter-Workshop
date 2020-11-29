
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
   int counter = 0 ;

  void getData() async{
    String username = await Future.delayed(Duration(seconds: 3), (){
      // await wait for current code to get over before moving further
      return 'yoshi';
    });
    String bio = await Future.delayed(Duration(seconds: 2),(){
      return 'phuurrrrr';
    });
    print('$username and $bio'); // wait fro bio and username to get complete first
  }

  @override
  void initState() { // called only once when the widget is created and subscribe to streams or any object that could change widget data
    // TODO: implement initState
    super.initState();

    getData();
    print('init state start');

  }

  @override
  Widget build(BuildContext context) {

    print('build fired');
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
          onPressed: (){
            setState(() { // run build every time this setState Fired
              counter += 1;
            });
          },
        child: Text('Counter is $counter'),
        )
      );
  }
}
