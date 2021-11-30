part of models;

class Box {
  static const int MINIMUM_STACK_LEVEL = 1;
  late String name;
  late int _maxStackLevel, _maxWarehouseStackLevel;

  late Dimensions dimensions;

  ///gross - box weight + assets weight,
  ///net - only box weight.
  late BoxWeights weights;
  late Capacities capacities;
  late BattleAirAsset battleAirAsset;
  late Coordinates coordinates;

  late BoxType type;

  Box(
      {int maxStackLevel = MINIMUM_STACK_LEVEL,
        int maxWarehouseStackLevel = MINIMUM_STACK_LEVEL,
      required this.name,
      required this.dimensions,
      required this.weights,
      required this.capacities,
      required this.battleAirAsset,
      required this.type,
      required this.coordinates}) {
    this.maxStackLevel = maxStackLevel;
    this._maxWarehouseStackLevel = maxWarehouseStackLevel;
  }

  Box.empty() {
    this._initialEmptyValues();
  }

  Box.specificType(BoxType type, {bool filled = true}) {
    this._initialEmptyValues();
    this._copyValuesFromDB(type);
    if (filled) this.fillToMaximum();
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
    this._maxWarehouseStackLevel = MINIMUM_STACK_LEVEL;
    this.coordinates = Coordinates();
  }

  void _copyValuesFromDB(BoxType boxType) {
    Box box = DatabaseBoxes.container[boxType] as Box;
    this.weights = BoxWeights(
        net: box.weights.net,
        gross: box.weights.gross,
        netExplosive: box.weights.netExplosive);
    this.dimensions = Dimensions(
        height: box.dimensions.height,
        width: box.dimensions.width,
        length: box.dimensions.length);
    this.capacities = Capacities(maximum: box.capacities.maximum);
    this.battleAirAsset = box.battleAirAsset;
    this.type = box.type;
    this.maxStackLevel = box.maxStackLevel;
    this._maxWarehouseStackLevel = box.maxWarehouseStackLevel;
    this.coordinates = box.coordinates;
  }

  int get maxStackLevel => _maxStackLevel;

  int get maxWarehouseStackLevel => this._maxWarehouseStackLevel;

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
