import 'package:flex_junk/model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("checking the property", () {
    final model = Model();
    expect(model.property, 3);
  });
  test(
    "checking the sqrProperty",
    () {
      final model = Model();
      expect(model.sqrProperty(), 9);
    },
  );
}
