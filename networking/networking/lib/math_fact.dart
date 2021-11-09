import 'dart:math';

class MathFact {
  String text;
  int number;
  bool found;
  String type;

  MathFact({
    required this.text,
    required this.number,
    required this.found,
    required this.type,
  });
  factory MathFact.fromJson(Map<String, dynamic> json) {
    return MathFact(
        text: json["text"] ?? "",
        number: json['number'] as int? ?? Random().nextInt(100000),
        found: json['found'] as bool? ?? false,
        type: json["type"] ?? "notype");
  }
}
