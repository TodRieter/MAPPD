class MathFact {
  final String text;
  final int num;

  const MathFact({
    this.text = "",
    this.num = 0,
  });

  factory MathFact.fromJson(Map<String, dynamic> json) {
    return MathFact(
      text: json["text"] ?? "",
      num: json["number"] ?? -1,
    );
  }
}
