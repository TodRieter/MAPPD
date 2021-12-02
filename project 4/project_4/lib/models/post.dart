import 'dart:convert';
import 'package:flutter/material.dart';

class Post {
  final String author;
  final String body;
  final String reviewer;
  final String title;
  final int date;
  Post(
    this.author,
    this.body,
    this.reviewer,
    this.title,
    this.date,
  );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(json['author'], json['body'], json['reviewer'], json['title'],
        json['date']);
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'body': body,
      'reviewer': reviewer,
      'title': title,
      'date': date,
    };
  }
}
