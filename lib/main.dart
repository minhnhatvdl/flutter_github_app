import 'package:flutter/material.dart';
import 'package:flutter_github_app/navigation/tabsbar_navigator.dart';
import 'package:flutter_github_app/providers/list_favorite_repos_provider.dart';
import 'package:flutter_github_app/providers/list_repos_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (_) => ListReposProvider(),
        ),
        ChangeNotifierProvider(
          builder: (_) => ListFavoriteReposProvider(),
        )
      ],
      child: MaterialApp(
        home: TabsbarNavigator(),
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.white,
          textTheme: TextTheme(
              title: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
              body1: TextStyle(fontSize: 16),
              headline: TextStyle(color: Colors.green),
              button: TextStyle(fontSize: 18, color: Colors.green)),
        ),
      ),
    );
  }
}
