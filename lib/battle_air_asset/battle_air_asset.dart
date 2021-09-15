import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/weights/weights.dart';

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