import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Screen/music_player.dart';
import 'package:music_app/Screen/oauthlogin.dart';
import 'package:music_app/Screen/splash_screen.dart';
import 'package:music_app/Screen/music.dart';
import 'package:music_app/models/song.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  // Song song = Song();
  // song.url = 'dasda';
  // song.name = 'dsadsadsa';
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
       home: SplashScreen(),
      // home: Music(),
      //home: MusicPlayer(song),
    )
  );
}

