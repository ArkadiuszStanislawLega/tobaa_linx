import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/library.dart';

void main() {
  const int CORRECT_SIZE = 2;
  const int INCORRECT_BELOW_ZERO_SIZE = -1;

  const int CORRECT_EXPECTED = 2;
  const int INCORRECT_EXPECTED = 0;

  test("Constructor with arguments - set correct values", () {
    Dimensions dimensions = Dimensions(
        height: CORRECT_SIZE,
        width: CORRECT_SIZE,
        length: CORRECT_SIZE
    );

    expect(dimensions.height, CORRECT_EXPECTED);
    expect(dimensions.width, CORRECT_EXPECTED);
    expect(dimensions.length, CORRECT_EXPECTED);
    expect(dimensions.capacity, 8);
  });

  test("Constructor with height negative argument", () {
    Dimensions dimensions = Dimensions(
        height: INCORRECT_BELOW_ZERO_SIZE,
        width: CORRECT_SIZE,
        length: CORRECT_SIZE
    );

    expect(dimensions.height, INCORRECT_EXPECTED);
    expect(dimensions.width, CORRECT_EXPECTED);
    expect(dimensions.length, CORRECT_EXPECTED);
    expect(dimensions.capacity, INCORRECT_EXPECTED);
  });

  test("Constructor with width negative argument", () {
    Dimensions dimensions = Dimensions(
        height: CORRECT_SIZE,
        width: INCORRECT_BELOW_ZERO_SIZE,
        length: CORRECT_SIZE
    );

    expect(dimensions.height, CORRECT_EXPECTED);
    expect(dimensions.width, INCORRECT_EXPECTED);
    expect(dimensions.length, CORRECT_EXPECTED);
    expect(dimensions.capacity, INCORRECT_EXPECTED);
  });

  test("Constructor with length negative argument", () {
    Dimensions dimensions = Dimensions(
        height: CORRECT_SIZE,
        width: CORRECT_SIZE,
        length: INCORRECT_BELOW_ZERO_SIZE
    );

    expect(dimensions.height, CORRECT_EXPECTED);
    expect(dimensions.width, CORRECT_EXPECTED);
    expect(dimensions.length, INCORRECT_EXPECTED);
    expect(dimensions.capacity, INCORRECT_EXPECTED);
  });

}