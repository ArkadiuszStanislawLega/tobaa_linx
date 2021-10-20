import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/weights/box_weights.dart';

class DatabaseBoxes {
  static final Map<BoxType, Box> container = {
    BoxType.CNU672: new Box(
        name: "CNU-672",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(
            gross: 523129,
            net: 523129,
            netExplosive: 497000
        ),
        dimensions: Dimensions(
            height: 787,
            width: 794,
            length: 4600
        ),
        maxStackLevel: 1,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM154]!,
        type: BoxType.CNU672
    ),

    BoxType.CNU614: new Box(
        name: "CNU-614",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(
            gross: 497000+1,
            net: 1,
            netExplosive: 497000
        ),
        dimensions: Dimensions(
            height:940,
            width: 990,
            length: 4572
        ),
        maxStackLevel: 1,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM158]!,
        type: BoxType.CNU614
    ),

    BoxType.CNU445: new Box(
        name: "CNU-445",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(
            gross: 197313,
            net: 197313,
            netExplosive: 65500
        ),
        dimensions: Dimensions(
            height: 762,
            width: 1016,
            length: 2743
        ),
        maxStackLevel: 1,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM65G]!,
        type: BoxType.CNU445
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