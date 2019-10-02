import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './navigation/tabsbar_navigator.dart';
import './providers/list_repos_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ListReposProvider(),
        )
      ],
      child: MaterialApp(
        home: TabsbarNavigator(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.white,
          textTheme: TextTheme(
            title: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
      ),
    );
  }
}
