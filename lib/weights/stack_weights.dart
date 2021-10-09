import 'package:tobaa/box/box.dart';
import 'package:tobaa/weights/weights.dart';
class StackWeights extends Weights {
  late double maxGross;
  late double maxNet;
  late double maxNetExplosion;

  late Box _currentBox;

  /// It's better to use constructor with args, or use setters to set max gross,
  /// net, netExplosive to proper work every functions.
  StackWeights({
    double net = 0.0,
    double gross = 0.0,
    double netExplosive = 0.0,
    this.maxGross = 0.0,
    this.maxNet = 0.0,
    this.maxNetExplosion = 0
  }) : super(net: net, gross: gross, netExplosive: netExplosive);

  @override
  set gross(double value){
    super.gross = value;
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

  void fillStack(List<Box> boxes) {
    if (boxes.isNotEmpty)
      this._addBoxes(boxes);
  }

  void _addBoxes(List<Box> boxes) {
    for (int i = 0; i < boxes.length; i++) {
      this.addBoxWeights(boxes[i]);
    }
    // this._currentBox = new Box();
  }

  void addBoxWeights(Box box){
    this._currentBox = box;
    this._increaseValues();
  }

  void _increaseValues(){
    this._increaseGross();
    // this._increaseNet();
    this._increaseNetExplosive();
  }

  bool isBoxMeetsConditionsToBeAdd(Box box){
    this._currentBox = box;
    bool gross = this._isGrossMetConditions();
    bool netExplosive = this._isNetExplosiveMetConditions();
    bool answer = gross && netExplosive;

    // this._currentBox = new Box();
    return answer;
  }


  bool _isNetExplosiveMetConditions() {
    return this.maxNetExplosion >=
        this.netExplosive + this._currentBox.weights.currentNetExplosive;
  }

  bool _isGrossMetConditions(){
    return this.maxGross >= this.gross + this._currentBox.weights.currentGross;
  }


  /// All baa weight net explosive value in stack.
  void _increaseNetExplosive(){
    if(this._isNetExplosiveMetConditions())
      this.netExplosive += this._currentBox.weights.currentNetExplosive;
  }

  /// All baa weight value in stack with boxes weight.
  void _increaseGross(){
    if(this._isGrossMetConditions())
      this.gross += this._currentBox.weights.currentGross;
  }

  void _increaseNet(){
    this.gross += this._currentBox.weights.net;
  }

  void fillToMaximum() {
    this.gross = this.maxGross;
    this.net = this.maxNet;
    this.netExplosive = this.maxNetExplosion;
  }
}