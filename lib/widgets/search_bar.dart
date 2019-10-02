import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/list_repos_provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchController = TextEditingController();

  void _handleSearch(BuildContext ctx) {
    Provider.of<ListReposProvider>(ctx, listen: false)
        .getListRepos(_searchController.text)
        .then((_) => {});
  }

  @override
  void initState() {
    _searchController.text =
        Provider.of<ListReposProvider>(context, listen: false).username;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  decoration: InputDecoration(labelText: 'Search'),
                  controller: _searchController,
                ),
              ),
              InkWell(
                child: Icon(
                  Icons.search,
                  size: 32,
                  color: Theme.of(context).primaryColor,
                ),
                onTap: () => _handleSearch(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
