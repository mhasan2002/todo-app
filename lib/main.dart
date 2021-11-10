import 'package:flutter/material.dart';
import 'package:todo_app/Todo_list.dart';
import 'package:todo_app/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Colors.grey[900]),
      home: Register(),
    );
  }
}
