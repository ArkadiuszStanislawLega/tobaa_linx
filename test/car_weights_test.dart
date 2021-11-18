import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/loading_area_weights.dart';


void main() {
  const double MAXIMUM_WEIGHT = 2;

  const double INCREASING_CORRECT_VALUE = 2;
  const double BIGGER_THEN_MAX_WEIGHT = 3;
  const double BELOW_ZERO_VALUE = -1;

  const double EXPECTING_WEIGHT_AFTER_POSITIVE_INCREASE = 2;
  const double EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE = 0;

  test("constructor - correct value", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    expect(weights.maximum, EXPECTING_WEIGHT_AFTER_POSITIVE_INCREASE);
    expect(weights.maximumNetExplosive, EXPECTING_WEIGHT_AFTER_POSITIVE_INCREASE);
    expect(weights.current, 0);
    expect(weights.currentNetExplosive, 0);
  });

  test("constructor - below zero values", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: BELOW_ZERO_VALUE,
        maximumNetExplosive: BELOW_ZERO_VALUE
    );
    expect(weights.maximum, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
    expect(weights.maximumNetExplosive, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
    expect(weights.current, 0);
    expect(weights.currentNetExplosive, 0);
  });

  test("constructor - correct values and below zero values", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: BELOW_ZERO_VALUE
    );
    expect(weights.maximum, EXPECTING_WEIGHT_AFTER_POSITIVE_INCREASE);
    expect(weights.maximumNetExplosive, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
    expect(weights.current, 0);
    expect(weights.currentNetExplosive, 0);
  });

  test("constructor - below zero and correct values", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: BELOW_ZERO_VALUE,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    expect(weights.maximum, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
    expect(weights.maximumNetExplosive, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
    expect(weights.current, 0);
    expect(weights.currentNetExplosive, 0);
  });

  test("increase current weight - correct value", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    var expectedBoolean = true;
    var actualBoolean = weights.tryIncreaseCurrentWeight(INCREASING_CORRECT_VALUE);
    expect(actualBoolean, expectedBoolean);
    expect(weights.current, EXPECTING_WEIGHT_AFTER_POSITIVE_INCREASE);
  });

  test("increase current weight - bigger then maximum value  - false", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    var expectedBoolean = false;
    var actualBoolean = weights.tryIncreaseCurrentWeight(BIGGER_THEN_MAX_WEIGHT);
    expect(actualBoolean, expectedBoolean);
    expect(weights.current, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
  });

  test("increase current weight - lower then zero value - false", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    var expectedBoolean = false;
    var actualBoolean = weights.tryIncreaseCurrentWeight(BELOW_ZERO_VALUE);
    expect(actualBoolean, expectedBoolean);
    expect(weights.current, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
  });

  test("increase current weight - zero - false", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    var expectedBoolean = false;
    var actualBoolean = weights.tryIncreaseCurrentWeight(0);
    expect(actualBoolean, expectedBoolean);
    expect(weights.current, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
  });

  test("increase current net explosive weight - correct value", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    var expectedBoolean = true;
    var actualBoolean = weights.tryIncreaseCurrentNetExplosiveWeight(INCREASING_CORRECT_VALUE);
    expect(actualBoolean, expectedBoolean);
    expect(weights.currentNetExplosive, EXPECTING_WEIGHT_AFTER_POSITIVE_INCREASE);
  });

  test("increase  current net explosive weight - bigger then maximum value  - false", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    var expectedBoolean = false;
    var actualBoolean = weights.tryIncreaseCurrentNetExplosiveWeight(BIGGER_THEN_MAX_WEIGHT);
    expect(actualBoolean, expectedBoolean);
    expect(weights.currentNetExplosive, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
  });

  test("increase  current net explosive weight - lower then zero value  - false", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    var expectedBoolean = false;
    var actualBoolean = weights.tryIncreaseCurrentNetExplosiveWeight(BELOW_ZERO_VALUE);
    expect(actualBoolean, expectedBoolean);
    expect(weights.currentNetExplosive, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
  });

  test("increase  current net explosive weight - zero value  - false", () {
    LoadingAreaWeights weights = LoadingAreaWeights(
        maximum: MAXIMUM_WEIGHT,
        maximumNetExplosive: MAXIMUM_WEIGHT
    );
    var expectedBoolean = false;
    var actualBoolean = weights.tryIncreaseCurrentNetExplosiveWeight(0);
    expect(actualBoolean, expectedBoolean);
    expect(weights.currentNetExplosive, EXPECTING_WEIGHT_AFTER_NEGATIVE_INCREASE);
  });
}