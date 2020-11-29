import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data ={};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments; // this going to be revived argument from loading.dart
    print(data);

    var col = data['isdaytime'] ? 'black' : 'blue';
    return Scaffold(
      backgroundColor: data['isdaytime'] ? Colors.blue : Colors.black12,
      body:   SafeArea(
          //child: Text('hello ')
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0 ,0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: (){
                    Navigator.pushNamed(context , '/Location');// we going to push named route, means new screen will come overlap current screen,
                  },
                  icon: Icon(Icons.edit_location),
                  label : Text('Edit'),
                  color: data['isdaytime'] ? Colors.black12 : Colors.white,

              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children : <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      color: data['isdaytime'] ? Colors.black12 : Colors.white,
                    ),
                  )
                ]
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: data['isdaytime'] ? Colors.black12 : Colors.white,
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}
