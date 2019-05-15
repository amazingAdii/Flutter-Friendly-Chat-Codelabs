import 'package:flutter/material.dart';
import 'ChatScreen.dart';

void main() => runApp(myApp());

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Friendly Chat",
      home: ChatScreen()
    );
  }
}
