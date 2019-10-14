import 'package:flutter/material.dart';
import 'package:flutter_github_app/src/favorite/providers/list_favorite_repos_provider.dart';
import 'package:flutter_github_app/src/home/providers/repos_provider.dart';
import 'package:flutter_github_app/src/home/widgets/repos_item.dart';
import 'package:provider/provider.dart';

class ListFavoriteRepos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ReposProvider> listFavoriteRepos =
        Provider.of<ListFavoriteReposProvider>(context).listFavoriteRepos;
    return ListView.builder(
      itemCount: listFavoriteRepos.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: listFavoriteRepos[index], child: ReposItem()),
    );
  }
}