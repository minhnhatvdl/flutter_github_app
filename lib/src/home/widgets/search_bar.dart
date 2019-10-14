import 'package:flutter/material.dart';
import 'package:flutter_github_app/src/home/providers/list_repos_provider.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController.text =
        Provider.of<ListReposProvider>(context, listen: false).username;
  }

  @override
  Widget build(BuildContext context) {
    final getListRepos =  Provider.of<ListReposProvider>(context, listen: false).getListRepos;
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: LayoutBuilder(
          builder: (ctx, constraints) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: constraints.maxWidth - 32,
                child: TextField(
                  decoration: InputDecoration(labelText: 'Search username on Github'),
                  controller: _searchController,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.search,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () => getListRepos(_searchController.text),
              )
            ],
          ),
        ),
      ),
    );
  }
}
