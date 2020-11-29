import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_app/Screen/login.dart';
import 'package:music_app/Screen/music.dart';
import 'package:music_app/Screen/oauthlogin.dart';
import 'package:music_app/utils/constants.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _movetonextscreen(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> OAuthLogin())); //(where you are, where you want to go) // PUSH REPLAcement replace current screen with new one
  }

  _loadandmove(){
    Timer(Duration(seconds: 7),(){
      _movetonextscreen();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadandmove(); // initState is automatically called only once to call build state so it will automatically move to next screen only once app is opened
  }
  @override
  Widget build(BuildContext context) {
    var media  = MediaQuery.of(context).size; // context means your device Media query take information of your device
    return Scaffold(
      body: SafeArea(  // SafeArea() will ensure that the content will not lay on the wifi section or anywhere outside the screen, or overlap mobile featuar
        child: Stack(   // stack is used to show the feature one over other like stack
          children: <Widget> [
            Container(
               width: media.width,
               height: media.height,
               decoration: BoxDecoration( // create box
                 gradient: LinearGradient(colors: [
                   Colors.orangeAccent,
                   Colors.tealAccent,
                 ],begin: Alignment.topLeft, end : Alignment.bottomRight),
               ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(Constants.SPLASH_IMG_URL),
                  Text('Music App',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color :Colors.redAccent)
                  ),
                  SizedBox(height: 130), // give gap b/w elements
                  Text('All CopyRight\'s Reserved'),
                  Container(
                    margin: EdgeInsets.only(top:10),
                    child: RaisedButton(
                        elevation: 10,
                        padding: EdgeInsets.all(20),
                        color: Colors.tealAccent,
                        onPressed: (){
                          _movetonextscreen();
                        },
                      child: Text('Go Further'),
                  ))
                ],
              ),
            )
          ],
        ),
      ),

    );
  }
}

// stack overlap the widget's like slice's
// On stack we have put the Container
// on container we have set the colors gradient
// above box we have child that contain image