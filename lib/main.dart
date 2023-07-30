import 'package:flutter/material.dart';
import 'circularContainer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spinner'),
        ),
        body: Center(
          child: CircularContainer(),
        ),
      ),
    );
  }
}




