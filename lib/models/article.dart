import 'dart:core';
import 'package:flutter/material.dart';
import 'relation.dart';

class Article {
  String name;
  String aliases;
  String age;
  String description;
  Image image;
  List<Relation> relations;
  
  Article({this.name, this.aliases, this.age, this.description, this.image, this.relations});
}