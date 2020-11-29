import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music_app/Screen/artist_screeen.dart';
import 'package:music_app/utils/constants.dart';
class OAuthLogin extends StatefulWidget {
  @override
  _OAuthLoginState createState() => _OAuthLoginState();
}

class _OAuthLoginState extends State<OAuthLogin> {
  FirebaseAuth _auth = FirebaseAuth.instance; //Create object of Firebase authentication
  GoogleSignIn _googleSignIn = GoogleSignIn(); // Firebase import GoogleSignIn

  _loginwithGmail() async{
    GoogleSignInAccount _googleSignInAccount = await _googleSignIn.signIn(); // signin in build function , open sign in screen
    GoogleSignInAuthentication _googleSignInAuth =  await _googleSignInAccount.authentication; // we need use await to wait on screen until sign in complete
    // create new GoogleAuthCredential from provided accessToken
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: _googleSignInAuth.accessToken,
      idToken: _googleSignInAuth.idToken
    );
    UserCredential userCredential = await _auth.signInWithCredential(credential);
    User userObject = userCredential.user;
    print("$userObject");
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> ArtistScreen(userObject, _auth)));
    //return userObject;
  }

  _loginwithFacebook(){
  }

  _createButton(String txt, String url, Future<dynamic> fn){
    return Center(
      child: Container(
        width: devicesize.width * 0.75,
        height: devicesize.height * 0.10,
        padding: EdgeInsets.all(10),
        child: RaisedButton(
            onPressed: (){
                fn  ;
            },
            child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                      child: Image.network(url)),
                  Text(
                  'Login',
                  style: TextStyle(fontSize: 20))
                ],

            ),
            ),
      ),
    );
  }

  Size devicesize;
  @override
  Widget build(BuildContext context) {
    devicesize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          height: devicesize.height,
          width: devicesize.width,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                      top: 0,
                      bottom: 0,
                      child: Image.network(Constants.LEFTBORDER),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _createButton("Login With Google",  Constants.GOOGLE_ICON, _loginwithGmail()),
                    Divider(height: 20),
                    _createButton("Login With Facebook", Constants.FACEBOOK_ICON, _loginwithFacebook()),
                  ],
                )
              ],
            ),
          ),
      ),
    );
  }
}
