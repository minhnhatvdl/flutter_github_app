import 'package:flutter/material.dart';
import 'package:flutter_github_app/screens/favorite_screen.dart';
import 'package:flutter_github_app/screens/home_screen.dart';
import 'package:flutter_github_app/widgets/Setting.dart';

class TabsbarNavigator extends StatefulWidget {
  @override
  _TabsbarNavigatorState createState() => _TabsbarNavigatorState();
}

class _TabsbarNavigatorState extends State<TabsbarNavigator> {
  // init list of tabsbar
  final List<Map<String, Object>> _listTabsbar = [
    {
      'title': 'Github Dashboard',
      'body': HomeScreen(),
      'icon': Icons.home,
      'icon_title': 'Dashboard',
    },
    {
      'title': 'Favorite',
      'body': FavoriteScreen(),
      'icon': Icons.favorite,
      'icon_title': 'Favorite',
    },
    {
      'title': 'Setting',
      'body': Setting(),
      'icon': Icons.settings,
      'icon_title': 'Setting',
    }
  ];
  // init index of tabsbar
  int _indexTabsbar = 0;
  // select a tabs
  void _selectTabsbar(index) {
    setState(() {
      _indexTabsbar = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar(
      title: Text(_listTabsbar[_indexTabsbar]['title']),
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: EdgeInsets.all(10),
        child: _listTabsbar[_indexTabsbar]['body'],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexTabsbar,
        onTap: _selectTabsbar,
        items: [
          for (final e in _listTabsbar)
            BottomNavigationBarItem(
              icon: Icon(e['icon']),
              title: Text(e['icon_title']),
            ),
        ]
      ),
    );
  }
}
