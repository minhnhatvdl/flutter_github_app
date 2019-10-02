import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/repos.dart';

class ListReposProvider with ChangeNotifier {
  List<Repos> _listRepos = [];
  List<Repos> get listRepos => _listRepos;

  String _username = '';
  String get username => _username;

  Future<void> getListRepos(String value) async {
    final String url = 'https://api.github.com/users/$value/repos';
    _username = value;
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      final List<Repos> result = [];
      data.forEach((e) {
        result.add(Repos(
          id: e['id'],
          name: e['name'],
          description: e['description'],
          owner: e['owner']['login'],
          dateCreation: e['created_at'],
        ));
      });
      _listRepos = result;
      notifyListeners();
    } catch (error) {
      _listRepos = [];
      notifyListeners();
    }
  }
}
