import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './repos_provider.dart';

class ListReposProvider with ChangeNotifier {
  // list of repos
  List<ReposProvider> _listRepos = [];
  List<ReposProvider> get listRepos => _listRepos;
  // username
  String _username = '';
  String get username => _username;
  // is loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  // get list of repos
  Future<void> getListRepos(String value) async {
    final String url =
        'https://api.github.com/users/$value/repos?client_id=8af6a1ce7f7702adce07&client_secret=45ba3b1f678b24b5e0dc38fc9a1f9049113f95ef';
    _username = value;
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(url);
      final data = json.decode(response.body);
      // list of repos
      final List<ReposProvider> result = [];
      data.forEach((e) {
        result.add(ReposProvider(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          owner: e['owner']['login'],
          dateCreation: e['created_at'],
          language: e['language'],
        ));
      });
      _listRepos = result;
    } catch (error) {
      _listRepos = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
