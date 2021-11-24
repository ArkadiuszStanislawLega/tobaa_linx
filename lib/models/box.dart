part of models;

class Box {
  static const int MINIMUM_STACK_LEVEL = 1;
  late String name;
  late int _maxStackLevel = MINIMUM_STACK_LEVEL;

  late Dimensions dimensions;
  ///gross - box weight + assets weight,
  ///net - only box weight.
  late BoxWeights weights;
  late Capacities capacities;
  late BattleAirAsset battleAirAsset;
  late Coordinates coordinates;

  late BoxType type;

  Box.empty() {
    this._initialEmptyValues();
  }

  void _initialEmptyValues() {
    int maxStackLevel = MINIMUM_STACK_LEVEL;
    this.name = "";
    this.dimensions = Dimensions();
    this.weights = BoxWeights();
    this.capacities = Capacities();
    this.battleAirAsset = BattleAirAsset.empty();
    this.type = BoxType.None;
    this.maxStackLevel = maxStackLevel;
    this.coordinates = Coordinates();
  }

  void _copyValuesFromDB(BoxType boxType){
    Box box = DatabaseBoxes.container[boxType] as Box;
    this.weights = BoxWeights(
        net: box.weights.net,
        gross: box.weights.gross,
        netExplosive: box.weights.netExplosive);
    this.dimensions = Dimensions(
        height: box.dimensions.height,
        width: box.dimensions.width,
        length: box.dimensions.length);
  }
  //Empty box
  Box.cnu445e() {
    this._initialEmptyValues();
    this._copyValuesFromDB(BoxType.CNU445);
  }

  //Filled box
  Box.cnu445f() {
    this._initialEmptyValues();
    this._copyValuesFromDB(BoxType.CNU445);
    this.fillToMaximum();
  }

  Box(
      {int maxStackLevel = MINIMUM_STACK_LEVEL,
      required this.name,
      required this.dimensions,
      required this.weights,
      required this.capacities,
      required this.battleAirAsset,
      required this.type,
      required this.coordinates}) {
    this.maxStackLevel = maxStackLevel;
  }

  int get maxStackLevel => _maxStackLevel;

  set maxStackLevel(int value) {
    if (this._isStackLevelMinimumRequirementsReached(value)) {
      this._maxStackLevel = value;
    }
  }

  bool _isStackLevelMinimumRequirementsReached(int stackLevel) {
    return stackLevel >= MINIMUM_STACK_LEVEL;
  }

  void fillToMaximum() {
    this.weights.fillToMaximum();
    this.capacities.fillToMaximum();
  }

  void fillBox(int value) {
    if (capacities.tryIncreaseCurrent(value))
      this.weights.fillBox(value, this.battleAirAsset);
  }
}
