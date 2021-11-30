import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:detatest/main.dart';

void main() {
  test("Test Post", runPostTest);
  test("many posts", makeManyPosts);
  test("query posts", queryPosts);
}

void queryPosts() async {
  await queryMessages().then((response) {
    final wrapper = jsonDecode(response.body);
    print(wrapper);
    final list = wrapper["items"];
    final posts = list.map((e) => Post.fromJson(e)).toList();
    print(posts.length);
  });
}

void makeManyPosts() async {
  final values = [1, 2, 3, 4, 5];
  for (var element in values) {
    await postMessage(
      "Manyposts $element",
      element,
      "many posts",
    ).then((response) => print(response.body));
  }
}

void runPostTest() async {
  await postMessage("HELLO WORLD!", 42, "Arthur Dent").then((response) {
    print("${response.statusCode}");
    print("${response.body}");
  });
}
