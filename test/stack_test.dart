import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/explosion_class/compatibility_group.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/explosion_class/explosion_subclass.dart';
import 'package:tobaa/stack/stack.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/weights/box_weights.dart';
import 'package:tobaa/weights/stack_weights.dart';
import 'package:tobaa/weights/weights.dart';

void main() {
  test("Constructor", () {
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

    Stack stack = new Stack(
      maximumStackLevel: 2,
      dimensions: StackDimensions(
        height: 1,
        width: 1,
        length: 5
      ),
      weights: StackWeights(
        maxNet: 1.0,
        maxGross: 33.0,
        maxNetExplosion: 15.0
      ),
      battleAirAssetCapacities: Capacities(
        maximum: 30
      ),
      defaultStackLevel: stackLevel
    );
    expect(stack.battleAirAssetCapacities.isFull, false);
    expect(stack.weights.gross, 0.0);
    expect(stack.dimensions.capacity, 5);
  });

  test("Fill stack.", () {
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
        boxType: BoxType.None,
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
        type: BattleAirAssetType.None,
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
        type: BoxType.None
    );
    box.fillToMaximum();

    Stack stack = new Stack(
        maximumStackLevel: 2,
        dimensions: StackDimensions(
            height: 1,
            width: 1,
            length: 5
        ),
        weights: StackWeights(
            maxNet: 60.0,
            maxGross: 66.0,
            maxNetExplosion: 30.0
        ),
        battleAirAssetCapacities: Capacities(
            maximum: 60
        ),
        defaultStackLevel: stackLevel
    );

    List<Box> boxes = [box, box, box];
    stack.addAllBoxes(boxes);
    expect(stack.levels[0].capacities.current, 30.0);
    // expect(stack.levels[0].weights.net, 3.0);
    expect(stack.levels[0].weights.netExplosive, 15.0);
    expect(stack.levels[0].weights.gross, 33.0);
    expect(stack.battleAirAssetCapacities.current, 30);
    expect(stack.weights.gross, 33.0);
    expect(stack.weights.net, 30.0);
    expect(stack.weights.netExplosive, 15.0);
    expect(stack.dimensions.length, 5);
    expect(stack.dimensions.width, 3);
    expect(stack.dimensions.height, 1);
    expect(stack.currentNumberOfBoxes, 3);

    List<Box> boxes2 = [box, box];
    stack.addAllBoxes(boxes2);

    expect(stack.battleAirAssetCapacities.current, 50);
    expect(stack.weights.gross, 55.0);
    expect(stack.weights.net, 50.0);
    expect(stack.weights.netExplosive, 25.0);
    expect(stack.dimensions.length, 5);
    expect(stack.dimensions.width, 3);
    expect(stack.dimensions.height, 2);
    expect(stack.currentNumberOfBoxes, 5);

    stack.addAllBoxes(boxes);

    expect(stack.battleAirAssetCapacities.current, 50);
    expect(stack.weights.gross, 55.0);
    expect(stack.weights.net, 50.0);
    expect(stack.weights.netExplosive, 25.0);
    expect(stack.dimensions.length, 5);
    expect(stack.dimensions.width, 3);
    expect(stack.dimensions.height, 2);
    expect(stack.currentNumberOfBoxes, 5);

  });
}