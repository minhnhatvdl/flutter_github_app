import 'package:flutter/material.dart';
import 'package:flutter_github_app/providers/list_repos_provider.dart';
import 'package:flutter_github_app/providers/repos_provider.dart';
import 'package:flutter_github_app/widgets/repos_item.dart';
import 'package:provider/provider.dart';

class ListRepos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listReposProvider = Provider.of<ListReposProvider>(context);
    final List<ReposProvider> listRepos = listReposProvider.listRepos;
    final bool isLoading = listReposProvider.isLoading;
    return isLoading
        ? Center(
      child: CircularProgressIndicator(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    )
        : ListView.builder(
      itemCount: listRepos.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
          value: listRepos[index], child: ReposItem()),
    );
  }
}
