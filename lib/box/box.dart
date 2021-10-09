import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/weights/box_weights.dart';

class Box{
  static const int MINIMUM_STACK_LEVEL = 1;
  late String name;
  late int _maxStackLevel = MINIMUM_STACK_LEVEL;

  late Dimensions dimensions;
  late BoxWeights weights;
  late Capacities capacities;
  late BattleAirAsset battleAirAsset;

  late BoxType type;

  Box.empty(){
    int maxStackLevel = MINIMUM_STACK_LEVEL;
    this.name = "";
    this.dimensions = Dimensions() ;
    this.weights = BoxWeights();
    this.capacities = Capacities();
    this.battleAirAsset = BattleAirAsset.empty();
    this.type = BoxType.None;
    this.maxStackLevel = maxStackLevel;
  }

  Box({
        int maxStackLevel = MINIMUM_STACK_LEVEL,
        required this.name,
        required this.dimensions ,
        required this.weights,
        required this.capacities,
        required this.battleAirAsset,
        required this.type
      }) {
    this.maxStackLevel = maxStackLevel;
  }

  int get maxStackLevel => _maxStackLevel;

  set maxStackLevel(int value) {
    if (this._isStackLevelMinimumRequirementsReached(value)){
      this._maxStackLevel = value;
    }
  }

  bool _isStackLevelMinimumRequirementsReached(int stackLevel){
    return stackLevel >= MINIMUM_STACK_LEVEL;
  }


  void fillToMaximum(){
    this.weights.fillToMaximum();
    this.capacities.fillToMaximum();
  }

  void fillBox(int value) {
    if (capacities.tryIncreaseCurrent(value))
      this.weights.fillBox(value, this.battleAirAsset);
  }
}