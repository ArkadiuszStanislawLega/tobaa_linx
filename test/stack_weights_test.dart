
import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/battle_air_asset.dart';
import 'package:tobaa/models/box.dart';
import 'package:tobaa/models/capacities.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/models/compatibility_group.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/explosion_class/explosion_subclass.dart';
import 'package:tobaa/weights/baa_weights.dart';
import 'package:tobaa/models/box_weights.dart';
import 'package:tobaa/models/stack_weights.dart';
import 'package:tobaa/models/weights.dart';

void main() {
  test("Fill stack.", () {
    const double MAX_GROSS = 22.0;
    const double MAX_NET = 20.0;
    const double MAX_NET_EXPLOSION = 10.0;
    StackWeights stackWeights = new StackWeights(
        maxGross: MAX_GROSS,
        maxNet: MAX_NET,
        maxNetExplosion: MAX_NET_EXPLOSION
    );
    BattleAirAsset baa = new BattleAirAsset(
        name: "New Baa",
        boxType: BoxType.test,
        dimensions: Dimensions(),
        explosionClass: ExplosionClass(
            explosionSubclass: ExplosionSubclass(),
            compatibilityGroup: CompatibilityGroup()
        ),
        type: BattleAirAssetType.test,
        weights: Weights(
            gross: 1.0,
            net: 1.0,
            netExplosive:  0.5
        )
    );

    Box b1 = new Box(
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


    b1.fillBox(9);

    Box b2 = new Box(
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