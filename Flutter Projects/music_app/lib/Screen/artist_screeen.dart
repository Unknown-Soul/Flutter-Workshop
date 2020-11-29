import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/Screen/music.dart';
import 'package:music_app/utils/constants.dart';
import 'dart:convert' as convert;

class ArtistScreen extends StatefulWidget {
  User _user;
  FirebaseAuth _auth;
  ArtistScreen(User userObject, FirebaseAuth _auth){
      this._user =userObject;
      this._auth = _auth;
 }

  @override
  _ArtistScreenState createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  _getStyle(){
    return TextStyle(fontSize: 16, color: Colors.black);
  }

  Future<List<dynamic>>_getallsinger() async{
    http.Response response = await http.get(Constants.SINGER_INFO_URL);
    String json = response.body;
    Map<String, dynamic> map = convert.jsonDecode(json);
    List<dynamic> list = map['singers'];
  }

  _signOut() async{
    if(widget._auth!=null){
      await widget._auth.signOut();
    }
  }

  _getDrawer(){
    return Drawer(
      elevation: 5,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(widget._user.photoURL),
            ),
            accountEmail: Text(widget._user.email, style: _getStyle()),
            accountName : Text(widget._user.displayName, style: _getStyle() ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.library_music, size: 20, color: Colors.black),
            title: Text("My Playlist", style: _getStyle()),
          ),
          ListTile(
            leading: Icon(Icons.money, size: 20, color: Colors.black),
            title: Text("Subscribe", style: _getStyle()),
          ),
          ListTile(
            leading: Icon(Icons.person, size: 20, color: Colors.black),
            title: Text("Profile", style: _getStyle()),
          ),
          ListTile(
            onTap: (){
              _signOut();
            },
            leading: Icon(Icons.exit_to_app, size: 20, color: Colors.black),
            title: Text("Sign Out", style: _getStyle()),
          ),
        ],
      ),
    );
  }

 _getallsingers() async{
    http.Response response = await http.get(Constants.SINGER_INFO_URL);
    String json = response.body;
    Map<String, dynamic> map = convert.jsonDecode(json);
    List<dynamic> list =map['singers'];
    return list;
  }

  _printOneSinger(var singer, int index){
      return Column(
        children: [
          InkWell(
            onTap: (){
                String singername = singer[index]['name'];
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Music(singername)));
            },
            hoverColor: Colors.white,
            splashColor: Colors.blue,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color : Colors.blue, width: 3),
              ),
              margin: EdgeInsets.all(08),
              width: 150,
              height: 150,
              child: CircleAvatar(
                backgroundImage: NetworkImage(singer[index]['photo']),
              ),
            ),
          ),
          Container(
            child: Text(
             singer[index]['name'],
             style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      );
  }

  _printgrid(AsyncSnapshot  snapshot){
    return GridView.builder(
        itemCount: snapshot.data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext crx, int index){
            return _printOneSinger(snapshot.data, index);
        },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _getDrawer(),
      appBar: AppBar(
        title: Text('Artist'),
        backgroundColor: Colors.blue,
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blueAccent, Colors.blueGrey, Colors.purpleAccent], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
          ),
          FutureBuilder(
          future: _getallsingers(),
          builder: (BuildContext ctx, AsyncSnapshot snapShot){
            if(snapShot.data == null){
              return Center(
                child: CircularProgressIndicator(),
              );
            } // if data is not present
            return _printgrid(snapShot);
          },
        ),],
      ),
    );
  }
}
