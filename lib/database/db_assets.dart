import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/explosion_class/compatibility_group.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/explosion_class/explosion_subclass.dart';
import 'package:tobaa/weights/weights.dart';

import 'db_compatibility_group.dart';
import 'db_explosion_subclasses.dart';

class DatabaseAssets {
  static Map<BattleAirAssetType, BattleAirAsset> container = {
    BattleAirAssetType.AGM154: new BattleAirAsset(
        type: BattleAirAssetType.AGM154,
        boxType: BoxType.CNU672,
        name: "AGM-154C JSOW",
        weights: Weights(
            gross: 497000,
            netExplosive: 88900,
            net: 497000
        ),
        dimensions: Dimensions(
            height: 1,
            length: 1,
            width: 1
        ),
        explosionClass: ExplosionClass(
            compatibilityGroup: DatabaseCompatibilityGroup
                .container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)
    ),

    BattleAirAssetType.AGM158: new BattleAirAsset(
        type: BattleAirAssetType.AGM158,
        boxType: BoxType.CNU614,
        name: "AGM-158-6 JASSM",
        weights: Weights(
            gross: 497000,
            netExplosive: 88900,
            net: 497000
        ),
        dimensions: Dimensions(
            height: 1,
            length: 1,
            width: 1
        ),
        explosionClass: ExplosionClass(
            compatibilityGroup: DatabaseCompatibilityGroup
                .container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)
    ),

    BattleAirAssetType.AGM65G: BattleAirAsset(
        type: BattleAirAssetType.AGM65G,
        boxType: BoxType.CNU445,
        name: "AGM-65G2 MAVERIC",
        weights: Weights(
            gross: 503413,
            netExplosive: 65500,
            net: 197313
        ),
        dimensions: Dimensions(
            height: 1,
            length: 1,
            width: 1
        ),
        explosionClass: ExplosionClass(
            compatibilityGroup: DatabaseCompatibilityGroup
                .container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)
    ),

    BattleAirAssetType.AIM9x: new BattleAirAsset(
        type: BattleAirAssetType.AIM9x,
        boxType: BoxType.CNU609,
        name: "AIM-9X SIDEWINDER",
        weights: Weights(
            gross: 85000,
            netExplosive: 30800,
            net: 85000
        ),
        dimensions: Dimensions(
            height: 1,
            length: 1,
            width: 1
        ),
        explosionClass: ExplosionClass(
            compatibilityGroup: DatabaseCompatibilityGroup
                .container[CompatibilityGroupType.E]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)
    ),

    BattleAirAssetType.AIM120: new BattleAirAsset(
        type: BattleAirAssetType.AIM120,
        boxType: BoxType.CNU431,
        name: "AIM-120 C5 AMRAAM",
        weights: Weights(
            gross: 161500,
            netExplosive: 58200,
            net: 161500
        ),
        dimensions: Dimensions(
            height: 1,
            length: 1,
            width: 1
        ),
        explosionClass: ExplosionClass(
            compatibilityGroup: DatabaseCompatibilityGroup
                .container[CompatibilityGroupType.E]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.2]!)
    )
  };
}