import 'package:flutter/material.dart';
import 'package:flutter_github_app/src/favorite/providers/list_favorite_repos_provider.dart';
import 'package:provider/provider.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deleteListFavoriteRepos =
        Provider.of<ListFavoriteReposProvider>(context, listen: false)
            .deleteListFavoriteRepos;
    return Center(
      child: FlatButton(
        onPressed: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Alert'),
              content: Text(
                  'Do you want to delete all favorites repositories ?'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(
                    'No',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    deleteListFavoriteRepos();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Yes',
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
              ],
            )),
        child: Text(
          'Delete all favorites',
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
