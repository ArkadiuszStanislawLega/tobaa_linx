import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/enumerators/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
  const double BASIC_VALUE = 0.0;
  const double CORRECT_VALUE = 0.3;

  const double EQUAL_ZERO = 0;
  const double BELOW_ZERO = -0.1;

  test("Constructor", () {
    BoxWeights weights = new BoxWeights();
    expect(weights.net, BASIC_VALUE);
    expect(weights.currentGross, BASIC_VALUE);
    expect(weights.currentNetExplosive, EQUAL_ZERO);
  });

  test("Fill to maximum", () {
    BoxWeights boxWeights = new BoxWeights(
        net: CORRECT_VALUE, gross: CORRECT_VALUE, netExplosive: CORRECT_VALUE);
    boxWeights.fillToMaximum();

    expect(boxWeights.currentGross, CORRECT_VALUE);
    expect(boxWeights.currentNetExplosive, CORRECT_VALUE);
  });

  test("Method fill", () {
    const BAA_WEIGHTS = 1.0;

    const NET_BOX_WEIGHT = 1.0;
    const GROSS_BOX_WEIGHT = 10.0;
    const NET_EXPLOSIVE_BOX_WEIGHT = 9.0;

    const NUMBER_OF_BAA_TO_FILL_THE_BOX = 9;
    const NUMBER_OF_BAA_TO_OVERFILLED = 10;

    const MAX_GROSS_WEIGHT_WHEN_FILLED =
        NUMBER_OF_BAA_TO_FILL_THE_BOX * BAA_WEIGHTS + NET_BOX_WEIGHT;

    const MAX_NET_EXPLOSIVE_WEIGHT_WHEN_FILLED =
        NUMBER_OF_BAA_TO_FILL_THE_BOX * BAA_WEIGHTS;

    BoxWeights boxWeights = new BoxWeights();
    {
      boxWeights.gross = GROSS_BOX_WEIGHT;
      boxWeights.currentGross = NET_BOX_WEIGHT;
      boxWeights.net = NET_BOX_WEIGHT;
      boxWeights.netExplosive = NET_EXPLOSIVE_BOX_WEIGHT;
    }

    BattleAirAsset battleAirAsset = new BattleAirAsset(
      name: "",
      boxType: BoxType.test,
      dimensions: Dimensions(width: 1, length: 1, height: 1),
      explosionClass: ExplosionClass(
          explosionSubclass: ExplosionSubclass(id: 1, description: ""),
          compatibilityGroup:
              CompatibilityGroup(group: CompatibilityGroupType.None)),
      type: BattleAirAssetType.test,
      weights: Weights(
          gross: BAA_WEIGHTS, net: BAA_WEIGHTS, netExplosive: BAA_WEIGHTS),
      combatAssetType: CombatAssetType.none,
      hexogeneEquivalent: 0.0,
      materialIdentificationNumber: MaterialIdentificationNumber.empty(),
    );

    boxWeights.fillBox(NUMBER_OF_BAA_TO_FILL_THE_BOX, battleAirAsset);

    expect(boxWeights.currentGross, MAX_GROSS_WEIGHT_WHEN_FILLED);
    expect(
        boxWeights.currentNetExplosive, MAX_NET_EXPLOSIVE_WEIGHT_WHEN_FILLED);

    boxWeights.fillBox(NUMBER_OF_BAA_TO_OVERFILLED, battleAirAsset);

    expect(boxWeights.currentGross, MAX_GROSS_WEIGHT_WHEN_FILLED);
    expect(
        boxWeights.currentNetExplosive, MAX_NET_EXPLOSIVE_WEIGHT_WHEN_FILLED);

    boxWeights.fillBox(-1, battleAirAsset);

    expect(boxWeights.currentGross, MAX_GROSS_WEIGHT_WHEN_FILLED);
    expect(
        boxWeights.currentNetExplosive, MAX_NET_EXPLOSIVE_WEIGHT_WHEN_FILLED);
  });
}
