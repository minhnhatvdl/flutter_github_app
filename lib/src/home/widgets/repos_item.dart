import 'package:flutter/material.dart';
import 'package:flutter_github_app/providers/list_favorite_repos_provider.dart';
import 'package:flutter_github_app/providers/repos_provider.dart';
import 'package:flutter_github_app/widgets/detail_repos.dart';
import 'package:provider/provider.dart';

class ReposItem extends StatelessWidget {
  void showDetailRepos(BuildContext ctx, ReposProvider value) {
    showModalBottomSheet(context: ctx, builder: (_) => DetailRepos(value));
  }

  @override
  Widget build(BuildContext context) {
    final ReposProvider repos =
    Provider.of<ReposProvider>(context, listen: false);
    final ListFavoriteReposProvider listFavoriteReposProvider =
    Provider.of<ListFavoriteReposProvider>(context, listen: false);
    return InkWell(
      onTap: () => showDetailRepos(context, repos),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5),
        elevation: 1,
        child: ListTile(
          title: Text(
            repos.name,
            style: Theme.of(context).textTheme.title,
          ),
          subtitle: Text(
            repos.description ?? '',
          ),
          trailing: InkWell(
            onTap: () => listFavoriteReposProvider.toggleFavoriteRepos(repos),
            child: Consumer<ListFavoriteReposProvider>(
                builder: (ctx, listFavoriteReposProvider, _) {
                  final isFavoriteRepository = listFavoriteReposProvider.listFavoriteRepos
                      .indexWhere((e) => e.id == repos.id) >= 0;
                  return Icon(
                    isFavoriteRepository
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).primaryColor,
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
