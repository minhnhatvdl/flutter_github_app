
import 'package:flutter/material.dart';
import 'package:flutter_github_app/providers/repos_provider.dart';

class ListFavoriteReposProvider with ChangeNotifier {
  List<ReposProvider> _listFavoriteRepos = [];
  List<ReposProvider> get listFavoriteRepos => _listFavoriteRepos;
  // toggle repos in list of favorites repos
  void toggleFavoriteRepos(ReposProvider repos) {
    final index = _listFavoriteRepos.indexWhere((e) => e.id == repos.id);
    if(index >= 0) {
      // remove a favorite repos
      _listFavoriteRepos.removeAt(index);
    } else {
      // add a favorite repos
      _listFavoriteRepos.add(repos);
    }
    notifyListeners();
  }
  // delete all list of favorites repos
  void deleteListFavoriteRepos() {
    _listFavoriteRepos = [];
    notifyListeners();
  }
}