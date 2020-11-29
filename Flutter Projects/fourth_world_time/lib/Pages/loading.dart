import 'package:flutter/material.dart';
import 'package:fourth_world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  // void getData() async {
  //   Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
  //   Map data = jsonDecode(response.body); //json decode change jason data
  //   print(data);
  //   print(data['title']);
  // }
  //
  // void initState(){
  //   super.initState();
  //   getData();
  // }

  Future<void> setupWorldTime() async {
    WorldTime obj = WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await obj.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {// sending data to home
       'location': obj.location,
       'flag': obj.flag,
       'time': obj.time,
       'isdaytime': obj.isdaytime,
    });

  }
  void initState(){
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Padding(
      //   padding: EdgeInsets.all(50.0),
      //   child: Text('loading...'),
      // )
      backgroundColor: Colors.blue[900],
      body: Center(
          child : SpinKitFadingFour(
            color: Colors.white,
            size: 80.0,
          ),
      ),

    );
  }
}
