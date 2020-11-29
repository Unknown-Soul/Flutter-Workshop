import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/models/song.dart';

class MusicPlayer extends StatefulWidget {
  Song song;
  MusicPlayer(Song song){
    this.song = song;
  }
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool _isPlaying = false;
  AudioPlayer audioPlayer;
  Duration _duration;
  Duration _position;

  @override
  initState(){
    super.initState();
    _initAudioPlayer();
  }

  play() async{
    int result = await audioPlayer.play(widget.song.audioURL);
    print("result is $result");
    if(result ==1){
      setState(() {
        _isPlaying = true;
      });
    }
  }

  pause() async{
    int result = await audioPlayer.pause();
    if(result ==1){
      setState(() {
        _isPlaying = false;
      });
    }
  }

  stop() async{
    int result = await audioPlayer.stop();
    if(result ==1){
      setState(() {
        _isPlaying = false;
      });
    }
  }

  resume() async{
    int result = await audioPlayer.pause();
    if(result ==1){
      setState(() {
        _isPlaying = true;
      });
    }
  }


  _initAudioPlayer(){
    // Registering the listener
    audioPlayer = AudioPlayer();
    audioPlayer.onDurationChanged.listen((duration) {
      setState(() {
        _duration = duration;
      });
    });
    audioPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        _isPlaying = false;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((position) {
      setState(() {
        _position = position;
      });
    });
  }

  _getGap(){
    return SizedBox(height: 10);
  }
  _getSongBox(){
    return Container(
      color: Colors.blueGrey,
      width: width,
      height: height * 0.40,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            height: height * 0.20,
            width: width* 0.30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.song.url)
                )
            ),
          )
        ],
      ),

    );
  }

  _getStyle(double size){
    TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold);
  }
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    height =  MediaQuery.of(context).size.height;
    width =  MediaQuery.of(context).size.width;
    return Scaffold(
      body : SafeArea(child: Column(
          children: [
            _getSongBox(),
            _getGap(),
            Text(widget.song.name, style: _getStyle(40)),
            _getGap(),
            Slider(
              onChanged: (currentvalue){
                final pos = currentvalue * _duration.inMilliseconds;
                audioPlayer.seek(Duration(milliseconds: pos.round() ));
              },
              value: (_position != null && _duration!=null && _position.inMilliseconds > 0 && _position.inMilliseconds < _duration.inMilliseconds?_position.inMilliseconds/_duration.inMilliseconds:0.0),
                // max: 20,
                // min: 1,
                // value: 10,
            ),
            _getGap(),
            Text(
                _position != null ?"${_position.toString().split(".").first}/${_duration.toString().split(".").first}": "0.0",
                style: _getStyle(40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: Icon(Icons.volume_off, size: 30),
                    onPressed: () async{
                      await audioPlayer.setVolume(0.0);
                    },
                    ),
                IconButton(
                  icon: Icon(
                      _isPlaying ? Icons.pause:Icons.play_arrow,
                      size: 30),
                  onPressed: (){
                    if(_isPlaying){
                      pause();
                    }
                    else{
                      play();
                    }
                  },
                ),
                IconButton(
                  icon: Icon(Icons.stop, size: 30),
                  onPressed: (){
                    stop();
                  },
                ),
                IconButton (
                  icon: Icon(Icons.volume_up, size: 30),
                  onPressed: () async{
                    await audioPlayer.setVolume(1.0);
                  },
                ),
              ],
            ),
            RaisedButton(
                color: Colors.lightBlueAccent,
                onPressed: (){},
                child: Text('Add To Playlist', style: _getStyle(20)
                ),)

          ],
      )),
    );
  }
}
