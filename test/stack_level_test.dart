import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/explosion_class/compatibility_group.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/explosion_class/explosion_subclass.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/weights/box_weights.dart';
import 'package:tobaa/weights/stack_weights.dart';
import 'package:tobaa/weights/weights.dart';

void main() {
  test("Append box to stack.", () {
    StackLevel stackLevel = StackLevel(
      dimensions: StackDimensions(
        height: 1,
        length: 5,
        width: 3
      ),
      weights: StackWeights(
        maxNetExplosion: 15,
        maxGross: 33,
        maxNet: 30
      ),
      capacities: Capacities(
        maximum: 30
      )
    );

    BattleAirAsset baa = new BattleAirAsset(
        name: "New Baa",
        boxType: BoxType.test,
        dimensions: Dimensions(
            width: 1,
            length: 1,
            height: 1
        ),
        explosionClass: ExplosionClass(
            explosionSubclass: ExplosionSubclass(
                id:1,
                description: ""
            ),
            compatibilityGroup: CompatibilityGroup(
                group: CompatibilityGroupType.None
            )
        ),
        type: BattleAirAssetType.test,
        weights: Weights(
            gross: 1.0,
            net: 1.0,
            netExplosive:  0.5
        )
    );

    Box box = new Box(
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        weights: BoxWeights(
            gross: 11.0,
            net: 1.0,
            netExplosive: 5.0
        ),
        dimensions: Dimensions(
            height: 1,
            width: 1,
            length: 5
        ),
        maxStackLevel: 2,
        battleAirAsset: baa,
        type: BoxType.test
    );
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
        dimensions: StackDimensions(
            height: 1,
            length: 5,
            width: 3
        ),
        weights: StackWeights(
            maxNetExplosion: 15,
            maxGross: 33,
            maxNet: 30
        ),
        capacities: Capacities(
            maximum: 30
        )
    );

    BattleAirAsset baa = new BattleAirAsset(
        name: "New Baa",
        boxType: BoxType.test,
        dimensions: Dimensions(
            width: 1,
            length: 1,
            height: 1
        ),
        explosionClass: ExplosionClass(
            explosionSubclass: ExplosionSubclass(
                id:1,
                description: ""
            ),
            compatibilityGroup: CompatibilityGroup(
                group: CompatibilityGroupType.None
            )
        ),
        type: BattleAirAssetType.test,
        weights: Weights(
            gross: 1.0,
            net: 1.0,
            netExplosive:  0.5
        )
    );

    Box box = new Box(
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        weights: BoxWeights(
            gross: 11.0,
            net: 1.0,
            netExplosive: 5.0
        ),
        dimensions: Dimensions(
            height: 1,
            width: 1,
            length: 5
        ),
        maxStackLevel: 2,
        battleAirAsset: baa,
        type: BoxType.test
    );
    box.fillToMaximum();

    List<Box> boxes = [box, box, box];
    stackLevel.tryAppendBoxes(boxes);

    expect(stackLevel.capacities.current, 30);
    expect(stackLevel.dimensions.occupied.capacity, 15);
    expect(stackLevel.weights.netExplosive, 15);
    expect(stackLevel.weights.gross, 33);

    expect(stackLevel.isBoxWillBeFit(box), false);
  });

}