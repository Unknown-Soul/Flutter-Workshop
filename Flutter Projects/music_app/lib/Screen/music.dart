import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/Screen/music_player.dart';
import 'package:music_app/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JsonParser; // to convert string into json
import 'package:music_app/models/song.dart';
class Music extends StatefulWidget {
  String singername;
  Music(this.singername);
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {
    List<Song> songs = [];

    _callMusicPlayer(Song song){
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MusicPlayer(song)));
    }
    _fillSongs(List<dynamic> listsOfSongs){
     // listsOfSongs.forEach((singleSong)=>print(singleSong['artistName']));
      var tempsongs = listsOfSongs.map((singleSong){
        Song song = new Song();
        song.audioURL = singleSong['previewUrl'];
        song.Songname = singleSong['trackName'];
        song.name = singleSong['collectionName'];
        song.url = singleSong['artworkUrl60'];
        return song;
      }).toList();
      setState(() {
        songs = tempsongs;
      });
    }

  _loadsongs(){
    String url = Constants.getURL(widget.singername);
    Future<http.Response> data= http.get(url); // future is used for async response
    data  // if got data value transfer it to response
        .then((response){
          print("${response.body.runtimeType}");
          var map = JsonParser.jsonDecode(response.body);
          _fillSongs(map['results']);
          print("$map"); // key all the keys of json body
        })
        .catchError((err)=>print("Their is some error in fetching url"));
    // data will come as json form
  }


  
  @override
  void initState(){
    super.initState();
    _loadsongs();
  }

    AudioPlayer _audioPlayer = AudioPlayer();
    _playSong(String url){
      _audioPlayer.stop();
      _audioPlayer.play(url);    }

  List<Widget> printSongs(){
      return songs.map((song){

        return Container(
          margin: EdgeInsets.all(4),
          child: Card(
            elevation: 5,
            shadowColor: Colors.white70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.network(song.url),
                title: Text(song.Songname),
                subtitle: Text(song.name),
                trailing: IconButton(
                    onPressed: (){
                      _callMusicPlayer(song);
                      //_playSong(song.audioURL);
                    },
                    icon:Icon(
                        Icons.play_circle_fill_rounded,
                        size: 30,
                        color: Colors.blue)
                ),

              ),
            ),
          ),
        );
        // return Card(
        //   elevation: 5,
        //   shadowColor: Colors.white70,
        //   child: Row(
        //     children: [
        //       Image.network(song.url),
        //       Padding(
        //         padding: const EdgeInsets.all(10),
        //         child: Text(song.name.substring(0, song.name.length> 30? 30 : song.name.length), softWrap: false),
        //       ),
        //       Align(
        //         alignment: Alignment.centerRight,
        //         child: IconButton(
        //             icon: Icon(
        //             Icons.play_circle_fill_rounded,
        //             size: 20,
        //             color: Colors.blue,
        //             ),
        //         ),
        //       ),
        //     ],
        //   ),
        // );
      }).toList();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blueAccent, Colors.blueGrey, Colors.purpleAccent], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
                 children : printSongs(),
            ),
          ),
        ),
      ),
    );
  }
}
