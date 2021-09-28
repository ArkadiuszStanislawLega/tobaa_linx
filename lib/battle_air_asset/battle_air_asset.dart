import '/dimensions/dimensions.dart';
import '/enumerators/box_type.dart';
import '/enumerators/baa_type.dart';
import '/explosion_class/explosion_class.dart';
import '/weights/weights.dart';

class BattleAirAsset {
  String name;
  ExplosionClass explosionClass;
  Dimensions dimensions;
  Weights weights;
  BattleAirAssetType type;
  BoxType boxType;

  BattleAirAsset({
    required this.name,
    required this.explosionClass,
    required this.dimensions,
    required this.weights,
    required this.type,
    required this.boxType});
}