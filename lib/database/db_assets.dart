import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/weights/weights.dart';

import 'db_compatibility_group.dart';
import 'db_explosion_subclasses.dart';

class DatabaseAssets {
  static Map<BattleAirAssetType, BattleAirAsset> container = {
    BattleAirAssetType.AGM154: new BattleAirAsset(
        type: BattleAirAssetType.AGM154,
        boxType: BoxType.CNU672,
        name: "AGM-154C JSOW",
        weights: Weights(gross: 497000, netExplosive: 88900, net: 497000),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)),
    BattleAirAssetType.AGM158: new BattleAirAsset(
        type: BattleAirAssetType.AGM158,
        boxType: BoxType.CNU614,
        name: "AGM-158-6 JASSM",
        weights: Weights(gross: 497000, netExplosive: 108860, net: 497000),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)),
    BattleAirAssetType.AGM65G: BattleAirAsset(
        type: BattleAirAssetType.AGM65G,
        boxType: BoxType.CNU445,
        name: "AGM-65G2 MAVERIC",
        weights: Weights(gross: 306100, netExplosive: 65500, net: 306100),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)),
    BattleAirAssetType.AIM9x: new BattleAirAsset(
        type: BattleAirAssetType.AIM9x,
        boxType: BoxType.CNU609,
        name: "AIM-9X SIDEWINDER",
        weights: Weights(gross: 85000, netExplosive: 30800, net: 85000),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.E]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)),
    BattleAirAssetType.AIM120: new BattleAirAsset(
        type: BattleAirAssetType.AIM120,
        boxType: BoxType.CNU431,
        name: "AIM-120 C5 AMRAAM",
        weights: Weights(gross: 161500, netExplosive: 58200, net: 161500),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.E]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.2]!)),
    BattleAirAssetType.BBU35: new BattleAirAsset(
        type: BattleAirAssetType.BBU35,
        boxType: BoxType.BBU35BOX,
        name: "BBU-35/B",
        weights: Weights(gross: 10, netExplosive: 0.3628739, net: 10),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.S]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!)),
    BattleAirAssetType.BBU36: new BattleAirAsset(
        type: BattleAirAssetType.BBU36,
        boxType: BoxType.BBU36BOX,
        name: "BBU-36/B",
        weights: Weights(gross: 17, netExplosive: 0.997903, net: 17),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.S]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!))
    ,
    //TODO: Sprawdzić wagę cxu
    BattleAirAssetType.CXU3: new BattleAirAsset(
        type: BattleAirAssetType.CXU3,
        boxType: BoxType.M2A1,
        name: "CXU-3A/B",
        weights: Weights(gross: 4, netExplosive: 3, net: 4),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.G]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!))
    ,
    BattleAirAssetType.MJU7AB: new BattleAirAsset(
        type: BattleAirAssetType.MJU7AB,
        boxType: BoxType.MJU7ABOX,
        name: "MJU-7A/B",
        weights: Weights(gross: 370, netExplosive: 261, net: 370),
        dimensions: Dimensions(height: 205, length: 52, width: 25),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.G]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.3]!))
    ,
    BattleAirAssetType.MK82: new BattleAirAsset(
        type: BattleAirAssetType.MK82,
        boxType: BoxType.MHU149,
        name: "MK-82",
        weights: Weights(gross: 227000, netExplosive: 87000, net: 227000),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!))
    ,
    BattleAirAssetType.MK84: new BattleAirAsset(
        type: BattleAirAssetType.MK84,
        boxType: BoxType.MK84BOX,
        name: "MK-84",
        weights: Weights(gross: 925000, netExplosive: 428000, net: 925000),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!))
    ,
    BattleAirAssetType.MPLD: new BattleAirAsset(
        type: BattleAirAssetType.MPLD,
        boxType: BoxType.M548MPLD,
        name: "20 mm MP LD M70 A1",
        weights: Weights(gross: 270, netExplosive: 48, net: 270),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.G]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.2]!))
    ,
    BattleAirAssetType.TPRRR: new BattleAirAsset(
        type: BattleAirAssetType.TPRRR,
        boxType: BoxType.M548_TPRRR,
        name: "20 mm TP RRR LD M2",
        weights: Weights(gross: 270, netExplosive: 39, net: 270),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.C]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!))
    ,
    BattleAirAssetType.RR170AL: new BattleAirAsset(
        type: BattleAirAssetType.RR170AL,
        boxType: BoxType.CHAFF_BOX,
        name: "RR-170A/AL",
        weights: Weights(gross: 140, netExplosive: 0, net: 140),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.S]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!))
    ,
  };
}
