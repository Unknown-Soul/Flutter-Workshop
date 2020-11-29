// import 'dart:html';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fourth_world_time/Pages/choose_location.dart';
import 'package:fourth_world_time/Pages/home.dart';
import 'package:fourth_world_time/Pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: Home() ,// imported from home.dart
    initialRoute: '/',
    routes: {
      '/':(context) => Loading(), //base route
      '/home':(context) => Home(),
      '/Location':(context) => ChooseLocation(),
    },
  ));
}

// Routing is just like dictionary in python
// Asyncronous code is something which don't block the execution in case of wait() condition