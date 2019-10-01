import 'package:flutter/material.dart';
import './navigation/tabsbar_navigator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabsbarNavigator(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.white,
      ),
    );
  }
}
