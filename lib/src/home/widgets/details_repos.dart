import 'package:flutter/material.dart';
import 'package:flutter_github_app/src/home/providers/repos_provider.dart';
import 'package:intl/intl.dart';

class DetailRepos extends StatelessWidget {
  final ReposProvider repos;
  DetailRepos(this.repos);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        children: <Widget>[
          Text(
            repos.name,
            style: Theme.of(context).textTheme.headline,
          ),
          Text(
            repos.owner,
            style: Theme.of(context).textTheme.subhead,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              repos.description ?? '',
              style: Theme.of(context).textTheme.body1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                repos.language ?? '',
                style: Theme.of(context).textTheme.subtitle,
              ),
              Text(
                DateFormat('dd/MM/yyyy')
                    .add_jm()
                    .format(DateTime.parse(repos.dateCreation)),
                style: Theme.of(context).textTheme.subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
