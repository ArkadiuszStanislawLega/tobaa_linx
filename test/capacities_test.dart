import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/library.dart';


void main() {
  test("increase current - correct value", () {
    Capacities capacities = Capacities(maximum: 2);
    var expected = true;
    var actual = capacities.tryIncreaseCurrent(2);
    expect(actual, expected);
  });

  test("increase current - higher then maximum value", () {
    Capacities capacities = Capacities(maximum: 2);
    var expected = false;
    var actual = capacities.tryIncreaseCurrent(3);
    expect(actual, expected);
  });

  test("increase current - value below zero", () {
    Capacities capacities = Capacities(maximum: 2);
    var expected = false;
    var actual = capacities.tryIncreaseCurrent(-1);
    expect(actual, expected);
  });

  test("increase current - zero", () {
    Capacities capacities = Capacities(maximum: 2);
    var expected = false;
    var actual = capacities.tryIncreaseCurrent(0);
    expect(actual, expected);
  });
}