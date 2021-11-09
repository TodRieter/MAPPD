import 'dart:math';

import 'package:flutter/material.dart';

class PlaceKitten {
  final String imageUri;
  final int? number;
  const PlaceKitten({
    required this.imageUri,
    this.number,
  });

  factory PlaceKitten.fromJson(Map<String, dynamic> json) {
    return PlaceKitten(
      imageUri: json["body"],
      number: Random().nextInt(1000),
    );
  }
}
