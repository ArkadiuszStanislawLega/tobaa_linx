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
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(
            gross: 523129,
            net: 523129,
            netExplosive: 0
        ),
        dimensions: Dimensions(
            height: 787,
            width: 794,
            length: 4600
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM154]!,
        type: BoxType.test
    ),

    BoxType.CNU614: new Box(
        name: "CNU-614",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(
            gross: 1,
            net: 1,
            netExplosive: 0
        ),
        dimensions: Dimensions(
            height:940,
            width: 990,
            length: 4572
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM158]!,
        type: BoxType.test
    ),

    BoxType.CNU445: new Box(
        name: "CNU-445",
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 197313,
            net: 197313,
            netExplosive: 0
        ),
        dimensions: Dimensions(
            height: 762,
            width: 1016,
            length: 2743
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM65G]!,
        type: BoxType.test
    ),

    BoxType.CNU431: new Box(
        name: "CNU-431",
        capacities: Capacities(
            maximum: 4
        ),
        weights: BoxWeights(
            gross: 927000,
            net: 281000,
            netExplosive: 232800
        ),
        dimensions: Dimensions(
            height: 480,
            width: 968,
            length: 4416
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM120]!,
        type: BoxType.CNU431
    ),

    BoxType.CNU609: new Box(
        name: "CNU-609",
        capacities: Capacities(
            maximum: 4
        ),
        weights: BoxWeights(
            gross: 623495,
            net: 283495,
            netExplosive: 123200
        ),
        dimensions: Dimensions(
            height: 584,
            width: 1067,
            length: 3505
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM9x]!,
        type: BoxType.CNU609
    ),
  };
}