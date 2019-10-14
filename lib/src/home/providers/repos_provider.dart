import 'package:flutter/material.dart';

class ReposProvider with ChangeNotifier {
  final int id;
  final String name;
  final String description;
  final String owner;
  final String dateCreation;
  final String language;

  ReposProvider({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.owner,
    @required this.dateCreation,
    @required this.language,
  });
}
