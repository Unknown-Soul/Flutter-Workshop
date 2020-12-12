//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor: Colors.orange,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = List();
  String input = "";

  createTodo() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("todo").doc(input);

    //Map
    Map<String, dynamic> todo = {
      "title": input,
    };
    documentReference.set(todo).whenComplete(() => print("$input created"));
  }

  deleteTodo(item) {
    DocumentReference documentReference =
    FirebaseFirestore.instance.collection("todo").doc(item);

    documentReference.delete().whenComplete(() => print("deleted"));
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   todos.add("Item1");
  //   todos.add("Item2");
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("MyTodo"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Add Task"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            //todos.add(input);
                            createTodo();
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("todo").snapshots(),
          builder: (context, snapshots) {
              if(snapshots.data.documents == null)
                return CircularProgressIndicator();
              return ListView.builder(

                shrinkWrap: true,
                itemCount: snapshots.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot = snapshots.data.documents[index];
                  return Dismissible(
                      key: Key(index.toString()),
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          title: Text(documentSnapshot["title"]),
                          trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  deleteTodo(documentSnapshot["title"]);
                                  //todos.removeAt(index);
                                });
                              }),
                        ),
                      ));
                });
          }),
    );
  }
}
