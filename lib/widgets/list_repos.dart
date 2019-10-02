import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/repos.dart';
import '../providers/list_repos_provider.dart';

class ListRepos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Repos> listRepos =
        Provider.of<ListReposProvider>(context).listRepos;
    return Container(
      height: MediaQuery.of(context).size.height - 310,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        itemCount: listRepos.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.symmetric(vertical: 5),
          elevation: 1,
          child: ListTile(
            title: Text(
              listRepos[index].name,
              style: Theme.of(context).textTheme.title,
            ),
            subtitle: Text(
              listRepos[index].description != null? listRepos[index].description: '',
            ),
            trailing: InkWell(
              onTap: () {},
              child: Icon(
                Icons.favorite_border,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}