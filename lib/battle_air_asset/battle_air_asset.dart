import 'package:tobaa/enumerators/combat_asset_type.dart';

import '/dimensions/dimensions.dart';
import '/enumerators/box_type.dart';
import '/enumerators/baa_type.dart';
import '/explosion_class/explosion_class.dart';
import '/weights/weights.dart';

class BattleAirAsset {
  late String name;
  late ExplosionClass explosionClass;
  late Dimensions dimensions;
  late Weights weights;
  late BattleAirAssetType type;
  late BoxType boxType;
  late CombatAssetType combatAssetType;

  BattleAirAsset.empty() {
    this.name = "";
    this.explosionClass = ExplosionClass.empty();
    this.dimensions = Dimensions();
    this.weights = Weights();
    this.type = BattleAirAssetType.None;
    this.boxType = BoxType.None;
    this.combatAssetType = CombatAssetType.none;
  }

  BattleAirAsset(
      {required this.name,
      required this.explosionClass,
      required this.dimensions,
      required this.weights,
      required this.type,
      required this.boxType,
      required this.combatAssetType});
}
