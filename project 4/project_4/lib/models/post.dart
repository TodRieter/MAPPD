import 'dart:convert';
import 'package:flutter/material.dart';

class Post {
  final String author;
  final String body;
  final String reviewer;
  final String title;
  final int? date;
  final String? humanTime;
  String? key;
  Post({
    required this.author,
    required this.body,
    required this.reviewer,
    required this.title,
    required this.date,
    required this.humanTime,
    this.key,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      author: json['author'] ?? "null",
      body: json['body'] ?? "null",
      reviewer: json['reviewer'] ?? "null",
      title: json['title'] ?? "null",
      date: json['date'] ?? "null",
      humanTime: json['humanTime'] ?? "null",
      key: json["key"] ?? "null",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'body': body,
      'reviewer': reviewer,
      'title': title,
      'date': date ?? "",
      'humanTime': humanTime ?? "",
      "key": key ?? "",
    };
  }
}
