import 'dart:convert';

class Thing {
  final String first;
  final String second;
  final String third;
  Thing(
    this.first,
    this.second,
    this.third,
  );

  factory Thing.fromJson(Map<String, dynamic> json) {
    return Thing(json['first'], json['second'], json['third']);
  }

  Map<String, dynamic> toJson() {
    return {
      'first': first,
      'second': second,
      'third': third,
    };
  }
}
