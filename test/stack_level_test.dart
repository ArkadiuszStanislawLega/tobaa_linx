import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/database/library.dart';
import 'package:tobaa/enumerators/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("Append box to stack.", () {
    StackLevel stackLevel = StackLevel(
        dimensions: StackDimensions(height: 1, length: 5, width: 3),
        weights: StackWeights(maxNetExplosion: 15, maxGross: 33, maxNet: 30),
        capacities: Capacities(maximum: 30));

    BattleAirAsset baa = new BattleAirAsset(
        name: "New Baa",
        boxType: BoxType.test,
        dimensions: Dimensions(width: 1, length: 1, height: 1),
        explosionClass: ExplosionClass(
            explosionSubclass: ExplosionSubclass(id: 1, description: ""),
            compatibilityGroup:
                CompatibilityGroup(group: CompatibilityGroupType.None)),
        type: BattleAirAssetType.test,
        weights: Weights(gross: 1.0, net: 1.0, netExplosive: 0.5),
        materialIdentificationNumber: MaterialIdentificationNumber.empty(),
        hexogeneEquivalent: 0.0,
        combatAssetType: CombatAssetType.none);

    Box box = new Box(
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        weights: BoxWeights(gross: 11.0, net: 1.0, netExplosive: 5.0),
        dimensions: Dimensions(height: 1, width: 1, length: 5),
        maxStackLevel: 2,
        battleAirAsset: baa,
        type: BoxType.test);
    box.fillToMaximum();

    expect(stackLevel.isBoxWillBeFit(box), true);

    stackLevel.tryAppendBox(box);
    expect(stackLevel.capacities.current, 10);
    expect(stackLevel.weights.net, 10);
    expect(stackLevel.dimensions.occupied.capacity, 5);
    expect(stackLevel.weights.netExplosive, 5);
    expect(stackLevel.weights.gross, 11);

    stackLevel.tryAppendBox(box);
    expect(stackLevel.capacities.current, 20);
    expect(stackLevel.weights.net, 20);
    expect(stackLevel.dimensions.occupied.capacity, 10);
    expect(stackLevel.weights.netExplosive, 10);
    expect(stackLevel.weights.gross, 22);

    stackLevel.tryAppendBox(box);
    expect(stackLevel.capacities.current, 30);
    expect(stackLevel.weights.net, 30);
    expect(stackLevel.dimensions.occupied.capacity, 15);
    expect(stackLevel.weights.netExplosive, 15);
    expect(stackLevel.weights.gross, 33);

    expect(stackLevel.isBoxWillBeFit(box), false);
  });

  test("Append boxes to stack.", () {
    StackLevel stackLevel = StackLevel(
        dimensions: StackDimensions(height: 1, length: 5, width: 3),
        weights: StackWeights(maxNetExplosion: 15, maxGross: 33, maxNet: 30),
        capacities: Capacities(maximum: 30));

    BattleAirAsset baa = new BattleAirAsset(
      name: "New Baa",
      boxType: BoxType.test,
      dimensions: Dimensions(width: 1, length: 1, height: 1),
      explosionClass: ExplosionClass(
          explosionSubclass: ExplosionSubclass(id: 1, description: ""),
          compatibilityGroup:
              CompatibilityGroup(group: CompatibilityGroupType.None)),
      type: BattleAirAssetType.test,
      weights: Weights(gross: 1.0, net: 1.0, netExplosive: 0.5),
      materialIdentificationNumber: MaterialIdentificationNumber.empty(),
      hexogeneEquivalent: 0.0,
      combatAssetType: CombatAssetType.none,
    );

    Box box = new Box(
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        weights: BoxWeights(gross: 11.0, net: 1.0, netExplosive: 5.0),
        dimensions: Dimensions(height: 1, width: 1, length: 5),
        maxStackLevel: 2,
        battleAirAsset: baa,
        type: BoxType.test);
    box.fillToMaximum();

    List<Box> boxes = [box, box, box];
    stackLevel.tryAppendBoxes(boxes);

    expect(stackLevel.capacities.current, 30);
    expect(stackLevel.dimensions.occupied.capacity, 15);
    expect(stackLevel.weights.netExplosive, 15);
    expect(stackLevel.weights.gross, 33);

    expect(stackLevel.isBoxWillBeFit(box), false);
  });

  test("Append TPRRR box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.M548_TPRRR]!;
    Box box = DatabaseBoxes.container[BoxType.M548_TPRRR]!;

    box.fillBox(100);
    expect(stackLevel.isBoxWillBeFit(box), true);

    stackLevel.tryAppendBox(box);

    expect(stackLevel.weights.netExplosive, 3900);
  });
}
