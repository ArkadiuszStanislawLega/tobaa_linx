import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/enumerators/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("Fill stack.", () {
    const double MAX_GROSS = 22.0;
    const double MAX_NET = 20.0;
    const double MAX_NET_EXPLOSION = 10.0;
    StackWeights stackWeights = new StackWeights(
        maxGross: MAX_GROSS,
        maxNet: MAX_NET,
        maxNetExplosion: MAX_NET_EXPLOSION);
    BattleAirAsset baa = new BattleAirAsset(
      name: "New Baa",
      boxType: BoxType.test,
      dimensions: Dimensions(),
      explosionClass: ExplosionClass(
          explosionSubclass: ExplosionSubclass(),
          compatibilityGroup: CompatibilityGroup()),
      type: BattleAirAssetType.test,
      weights: Weights(gross: 1.0, net: 1.0, netExplosive: 0.5),
      hexogeneEquivalent: 0.0,
      materialIdentificationNumber: MaterialIdentificationNumber.empty(),
      combatAssetType: CombatAssetType.none,
    );

    Box b1 = new Box(
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        weights: BoxWeights(gross: 11.0, net: 1.0, netExplosive: 5.0),
        dimensions: Dimensions(height: 1, width: 1, length: 5),
        maxTransportStackLevel: 2,
        battleAirAsset: baa,
        type: BoxType.test,
        coordinates: Coordinates());

    b1.fillBox(9);

    Box b2 = new Box(
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        weights: BoxWeights(gross: 11.0, net: 1.0, netExplosive: 5.0),
        dimensions: Dimensions(height: 1, width: 1, length: 5),
        maxTransportStackLevel: 2,
        battleAirAsset: baa,
        type: BoxType.test,
        coordinates: Coordinates());

    b2.fillBox(9);

    List<Box> list = [b1, b2];

    stackWeights.fillStack(list);

    expect(stackWeights.gross, 20);
    expect(stackWeights.netExplosive, 9.0);

    stackWeights.fillToMaximum();
    expect(stackWeights.gross, MAX_GROSS);
    expect(stackWeights.netExplosive, MAX_NET_EXPLOSION);

    stackWeights.fillStack(list);
    expect(stackWeights.gross, MAX_GROSS);
    expect(stackWeights.netExplosive, MAX_NET_EXPLOSION);
  });
}
