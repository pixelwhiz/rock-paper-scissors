import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepPurpleAccent,
      title: Text("Batu Kertas Gunting"),
      centerTitle: true,
    ),
    backgroundColor: Colors.white,
    body: Center(
      child: Text("Hello"),

    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        print("qweoqwopej"),
      },
      child: Text("+"),
    ),
  ),
));
