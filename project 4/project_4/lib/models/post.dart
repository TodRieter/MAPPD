import 'dart:convert';
import 'package:flutter/material.dart';

class Post {
  final String avatar;
  final String username;
  final dynamic textField;
  Post(
    this.avatar,
    this.username,
    this.textField,
  );

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(json['avatar'], json['username'], json['textField']);
  }

  Map<String, dynamic> toJson() {
    return {
      'avatar': avatar,
      'username': username,
      'textField': textField,
    };
  }
}
