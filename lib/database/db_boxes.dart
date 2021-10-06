import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/weights/box_weights.dart';

class DatabaseBoxes {
  static final Map<BoxType, Box> container = {
    BoxType.test: Box(
      type: BoxType.test,
      name: "test box",
      capacities: Capacities(maximum: 10),
      dimensions: Dimensions(
          width: 11,
          length: 7,
          height: 2
      ),
      weights: BoxWeights(
          gross: 11,
          net: 1,
          netExplosive: 5
      ),
      battleAirAsset:
      DatabaseAssets.container[BattleAirAssetType.test]!,
    ),

    BoxType.oversizeTest: Box(
        type: BoxType.oversizeTest,
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        dimensions: Dimensions(
            width: 7,
            length: 7,
            height: 7
        ),
        weights: BoxWeights(
            gross: 2.0,
            net: 1.0,
            netExplosive: 0.5
        ),
        battleAirAsset:
        DatabaseAssets.container[BattleAirAssetType.test]!,
        maxStackLevel: 2
    ),

    BoxType.correctSizeTest: Box(
        type: BoxType.correctSizeTest,
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        dimensions: Dimensions(
            width: 1,
            length: 5,
            height: 10
        ),
        weights: BoxWeights(
            gross: 2.0,
            net: 1.0,
            netExplosive: 0.5
        ),
        battleAirAsset:
        DatabaseAssets.container[BattleAirAssetType.test]!,
        maxStackLevel: 2
    ),

    BoxType.heavyTest: Box(
        type: BoxType.heavyTest,
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        dimensions: Dimensions(
            width: 1,
            length: 5,
            height: 1
        ),
        weights: BoxWeights(
            gross: 1500001,
            net: 1500000,
            netExplosive: 0.5
        ),
        battleAirAsset:
        DatabaseAssets.container[BattleAirAssetType.test]!,
        maxStackLevel: 2
    ),

    BoxType.CNU672: new Box(
        name: "CNU-672",
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM154]!,
        type: BoxType.test
    ),

    BoxType.CNU614: new Box(
        name: "CNU-614",
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM158]!,
        type: BoxType.test
    ),

    BoxType.CNU445: new Box(
        name: "CNU-445",
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM65G]!,
        type: BoxType.test
    ),

    BoxType.CNU609: new Box(
        name: "CNU-609",
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM9x]!,
        type: BoxType.test
    ),

    BoxType.CNU431: new Box(
        name: "CNU-431",
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM120]!,
        type: BoxType.test
    ),
  };
}