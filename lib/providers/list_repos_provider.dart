import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/providers/repos_provider.dart';
import 'package:http/http.dart' as http;

class ListReposProvider with ChangeNotifier {
  List<ReposProvider> _listRepos = [];
  List<ReposProvider> get listRepos => _listRepos;
  String _username = '';
  String get username => _username;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  Future<void> getListRepos(String value) async {
    final String clientId = '8af6a1ce7f7702adce07';
    final String clientSecret = '45ba3b1f678b24b5e0dc38fc9a1f9049113f95ef';
    final String url =
        'https://api.github.com/users/$value/repos?client_id=$clientId&client_secret=$clientSecret';
    _username = value;
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(url);
      final data = json.decode(response.body);
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
