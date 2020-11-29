import 'package:flutter/material.dart';
import 'package:music_app/utils/constants.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  _createUserId(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Type User Id',
          labelText: 'User Id',
          prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(),
        ),
        ),
      );
  }


  _createButton(){
      return Container(
        padding : EdgeInsets.only(top: 20),
      child: MaterialButton(
        child: Text(
            'Login',
            textAlign: TextAlign.center),
        elevation: 20,
        color: Colors.black,
        textColor: Colors.grey,
        hoverColor: Colors.black26,
        onPressed: (){

        },
      ),
      );
  }


  _createPassword(){
    return  Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      child: TextField(
        obscureText: true,
        style: TextStyle(fontSize: 20),
        decoration: InputDecoration(
          hintText: 'Type password',
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Login'),
      //   centerTitle: true,
      //   titleSpacing: 10.0,
      // ),
      body: Stack(
        fit : StackFit.expand,
        children: [
          Image.network(
              Constants.LOGIN_IMG_URL,
              fit : BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                            margin : EdgeInsets.only(top: 20),
                            child: Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
                        _createUserId(),
                        _createPassword(),
                        _createButton(),
                      ],
                    ),
                    height: media.height * 0.45 ,
                    width: media.width * 0.75,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
      // backgroundColor: Colors.red,
    );
  }
}
