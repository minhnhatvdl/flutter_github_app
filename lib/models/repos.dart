import 'package:flutter/material.dart';

class Repos {
  final int id;
  final String name;
  final String description;
  final String owner;
  final String dateCreation;
  final bool isFavorite;

  Repos(
      {@required this.id,
      @required this.name,
      @required this.description,
      @required this.owner,
      @required this.dateCreation,
      this.isFavorite = false});
}
