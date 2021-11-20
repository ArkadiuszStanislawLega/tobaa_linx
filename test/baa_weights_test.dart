import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/library.dart';

void main() {
  const double CORRECT_VALUE = 0.2;

  const double EQUAL_ZERO = 0;
  const double BELOW_ZERO = -0.1;

  test("checking constructor with correct values", () {
    BaaWeights weights = new BaaWeights(
        gross: CORRECT_VALUE,
        net: CORRECT_VALUE,
        netExplosive: CORRECT_VALUE
    );
    expect(weights.gross, CORRECT_VALUE);
    expect(weights.net, CORRECT_VALUE);
    expect(weights.netExplosive, CORRECT_VALUE);
  });


  test("checking setter netExplosive", () {
    BaaWeights weights = new BaaWeights(
        gross: 0.3,
        net: 0.3,
        netExplosive: 0.3
    );

    const double LOWER_THEN_NET = 0.2;
    const double BIGGER_THEN_NET = 0.4;

    weights.netExplosive = LOWER_THEN_NET;
    expect(weights.netExplosive, LOWER_THEN_NET);

    weights.netExplosive = BIGGER_THEN_NET;
    expect(weights.netExplosive, LOWER_THEN_NET);

    weights.netExplosive = EQUAL_ZERO;
    expect(weights.netExplosive, LOWER_THEN_NET);

    weights.netExplosive = BELOW_ZERO;
    expect(weights.netExplosive, LOWER_THEN_NET);
  });

  test("Setter gross", () {
    BaaWeights weights = new BaaWeights(
        gross: 0.3,
        net: 0.3,
        netExplosive: 0.3
    );

    const double CURRENT_VALUE = 0.4;

    weights.gross = CURRENT_VALUE;
    expect(weights.gross, CURRENT_VALUE);

    weights.gross = EQUAL_ZERO;
    expect(weights.gross, CURRENT_VALUE);

    weights.gross = BELOW_ZERO;
    expect(weights.gross, CURRENT_VALUE);
  });

  test("Setter net", () {
    BaaWeights weights = new BaaWeights(
        gross: 0.2,
        net: 0.2,
        netExplosive: 0.2
    );

    const double HIGHER_THEN_CONSTRUCTOR = 0.3;
    const double BELOW_THEN_CONSTRUCTOR = 0.1;

    weights.net = BELOW_THEN_CONSTRUCTOR;
    expect(weights.net, BELOW_THEN_CONSTRUCTOR);

    weights.net = HIGHER_THEN_CONSTRUCTOR;
    expect(weights.net, BELOW_THEN_CONSTRUCTOR);

    weights.net = EQUAL_ZERO;
    expect(weights.net, BELOW_THEN_CONSTRUCTOR);

    weights.net = BELOW_ZERO;
    expect(weights.net, BELOW_THEN_CONSTRUCTOR);
  });
}