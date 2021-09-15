import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/weights/weights.dart';

class BoxWeights extends Weights {
  late double _currentGross;
  late double _currentNetExplosive;

  late double _grossToAdd;
  late double _netExplosiveToAdd;

  BoxWeights({
    double net = 0.0,
    double gross = 0.0,
    double netExplosive = 0.0
  }) : super(){
    this.gross = gross;
    this.net = net;
    this.netExplosive = netExplosive;
    this._currentGross = this.net;
    this._currentNetExplosive = 0.0;
  }

  double get currentGross => _currentGross;
  double get currentNetExplosive => _currentNetExplosive;

  set currentNetExplosive(double value) {
    this._netExplosiveToAdd = value;
    if (this._isDoubleHigherThenZero(value) && this._isNetExplosiveCanBeAdd())
      this._currentNetExplosive = value;
    this._netExplosiveToAdd = 0;
  }

  set grossAndCurrent(double value){
    if(this._isGrossConditionsHaveBeenMeet(value)) {
      super.gross = value;
      this._currentGross = value;
    }
  }

   @override
   set gross(double value){
       super.gross = value;
   }

  bool _isGrossConditionsHaveBeenMeet(double value){
    return this._isDoubleHigherThenZero(value) &&
        this._isValueHigherOrEqualToNetProperty(value);
  }

  bool _isValueHigherOrEqualToNetProperty(double value){
    return value >= this.net;
  }

  set currentGross(double value) {
    if (this._isCurrentGrossConditionsHaveBeenMeet(value))
      this._currentGross = value;
  }


  bool _isValueLowerOrEqualThenGross(double value){
    return value <= this.gross;
  }

  bool _isCurrentGrossConditionsHaveBeenMeet(double value){
    return this._isDoubleHigherThenZero(value) &&
        this._isValueLowerOrEqualThenGross(value);
  }

  set net(double value) {
    if (this._isDoubleHigherThenZero(value))
      super.net = value;
  }

  set netExplosive(double value) {
    if (this._isDoubleHigherThenZero(value) &&
        this._isDoubleLowerOrEqualGross(value))
      super.netExplosive = value;
  }

  bool _isDoubleHigherThenZero(double value){
    return value > 0;
  }

  bool _isDoubleLowerOrEqualGross(double value){
    return value <= this.gross;
  }

  void fillBox(int number, BattleAirAsset battleAirAsset) {
    if (this._isIntegerHigherThenZero(number)) {
      this._setValuesToAdd(battleAirAsset);
      this._increaseByTheSpecificNumberOfTimes(number);
    }
    this._clearValuesToAdd();
  }

  void _clearValuesToAdd(){
    this._grossToAdd = 0;
    this._netExplosiveToAdd = 0;
  }

  void _setValuesToAdd(BattleAirAsset battleAirAsset){
    this._grossToAdd = battleAirAsset.weights.gross;
    this._netExplosiveToAdd = battleAirAsset.weights.netExplosive;
  }

  void _increaseByTheSpecificNumberOfTimes(int number){
    for (int i = 0; i < number; i++) {
      if (!this._tryIncreaseWeight())
        break;
    }
  }

  bool _tryIncreaseWeight(){
    if (this._isNoWeightWasExceeded()) {
      this._increaseAllWeights();
      return true;
    }

    return false;
  }

  bool _isIntegerHigherThenZero(int value) {
    return value > 0;
  }

  bool _isNoWeightWasExceeded() {
    return this._isGrossCanBeAdd() && this._isNetExplosiveCanBeAdd();
  }

  bool _isGrossCanBeAdd() {
    return this._currentGross + this._grossToAdd <= this.gross;
  }

  bool _isNetExplosiveCanBeAdd() {
    return this._currentNetExplosive + this._netExplosiveToAdd <= this.netExplosive;
  }

  void _increaseAllWeights() {
    this._currentGross += this._grossToAdd;
    this._currentNetExplosive += this._netExplosiveToAdd;
  }

  void fillToMaximum() {
    this._currentGross = this.gross;
    this._currentNetExplosive = this.netExplosive;
  }


}