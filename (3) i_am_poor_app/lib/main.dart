import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lime,
        appBar: AppBar(
          title: Text(
            'I Am Poor',
            style: TextStyle(
              fontWeight: FontWeight.bold,  // Makes the text bold
              color: Colors.cyan,           // Sets the color to cyan
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 34, 55, 244),
          centerTitle: true,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/money.png'),
          ),
        ),
      ),
    ),
  );
}
