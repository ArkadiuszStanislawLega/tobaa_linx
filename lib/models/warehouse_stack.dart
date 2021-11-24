part of models;

class WarehouseStack {
  late int maximumStackLevel;
  late Dimensions dimensions;
  ///gross - all boxes + all assets weights,
  ///net - all assets weights.
  late StackWeights weights;
  late Capacities battleAirAssetCapacities;
  late List<StackLevel> levels;
  late StackLevel defaultStackLevel;

  late Box _currentBox;
  late List<Box> _boxesToAdd;

  WarehouseStack.empty() {
    this._initialEmptyValues();
  }
  
  void _initialEmptyValues(){
    this.maximumStackLevel = 0;
    this.dimensions = Dimensions();
    this.weights = StackWeights();
    this.battleAirAssetCapacities = Capacities();
    this.defaultStackLevel = StackLevel.empty();
    this.levels = [];
  }

  WarehouseStack.cnu445() {
    this._initialEmptyValues();

    WarehouseStack copied = DatabaseStacks.container[BoxType.CNU445]!;
    this.maximumStackLevel = copied.maximumStackLevel;
    this.battleAirAssetCapacities.maximum =
        copied.battleAirAssetCapacities.maximum;
    this.defaultStackLevel = DatabaseStackLevels.container[BoxType.CNU445]!;
    this.weights.maxGross = copied.weights.maxGross;
    this.weights.maxNet = copied.weights.maxNet;
    this.weights.maxNetExplosion = copied.weights.maxNetExplosion;
    this.dimensions.length = copied.dimensions.length;
    this.dimensions.width = copied.dimensions.width;
    this.dimensions.height = copied.dimensions.height;
  }

  WarehouseStack(
      {required this.maximumStackLevel,
      required this.dimensions,
      required this.weights,
      required this.battleAirAssetCapacities,
      required this.defaultStackLevel}) {
    this.levels = [];
  }

  int get currentStackLevel => this.levels.length;

  int get currentNumberOfBoxes {
    var value = 0;
    for (int i = 0; i < this.levels.length; i++) {
      value += this.levels[i].boxes.length;
    }
    return value;
  }

  bool isBoxCanBeAddedToStack(Box box) {
    this._currentBox = box;
    if (this._isBoxAreValidated()) {
      return true;
    }
    return false;
  }

  bool _isBoxAreValidated() {
    if (this._currentBox.capacities.current > 0) {
      if (this._isBoxTypeFitToStack()) {
        if (this._isNumberOfBaaWillBeFit(this._currentBox.capacities.current)) {
          return true;
        }
      }
    }
    return false;
  }

  bool isBoxesCanBeAddedToStack(List<Box> boxes) {
    this._boxesToAdd = boxes;
    if (this._isBoxesAreValidated()) {
      return true;
    }
    return false;
  }

  bool _isBoxesAreValidated() {
    var numberOfBaa = this._countCapacitiesWithNewBoxes();
    if (numberOfBaa > 0) {
      this._currentBox = this._boxesToAdd.first;
      if (this._isBoxTypeFitToStack()) {
        if (this._isNumberOfBaaWillBeFit(numberOfBaa)) {
          return true;
        }
      }
    }
    return false;
  }

  void addBox(Box box) {
    this._currentBox = box;
    if (!this._tryAddBox()) this._tryAddBoxToNewStackLevel();
  }

  bool _isBoxTypeFitToStack() {
    if (this.battleAirAssetCapacities.current == 0) return true;
    var firstStack = this.levels.first;
    var firstBoxInStack = firstStack.boxes.first;
    return firstBoxInStack.type == this._currentBox.type;
  }

  ///Before use it validate list by isBoxesCanBeAddedToStack method.
  void addAllBoxes(List<Box> boxes) {
    this._boxesToAdd = boxes;
    this._addBoxToSomeStackLevel();
  }

  void _addBoxToSomeStackLevel() {
    if (this._boxesToAdd.isNotEmpty) {
      this._boxesToAdd.forEach((box) {
        this._currentBox = box;
        if (!this._tryAddBox())
          this._tryAddBoxToNewStackLevel();
      });
    }
  }

  void _tryAddBoxToNewStackLevel() {
    if (this._isNewStackLevelIsAdded()) this._tryAddBox();
  }

  bool _isNewStackLevelIsAdded() {
    if (this._isStackLvlCanBeAdd()) {
      this.levels.add(this._copyDefaultStackLevel());
      this.dimensions.height += this.defaultStackLevel.dimensions.height;
      return true;
    }
    return false;
  }

  bool _tryAddBox() {
    if (this._isFitToStack()) {
      this._addBoxToStack();
      return true;
    }
    return false;
  }

  int _countCapacitiesWithNewBoxes() {
    int boxesCapacity = 0;
    if (this._boxesToAdd.isNotEmpty) {
      this._boxesToAdd.forEach((box) {
        boxesCapacity += box.capacities.current;
      });
    }
    return boxesCapacity;
  }

  bool _isNumberOfBaaWillBeFit(int numberOfBaa) {
    return numberOfBaa + battleAirAssetCapacities.current <=
        battleAirAssetCapacities.maximum;
  }

  bool _isFitToStack() {
    for (int j = 0; j < this.levels.length; j++) {
      if (this.levels[j].isBoxWillBeFit(this._currentBox))
        return true;
    }
    return false;
  }

  bool _isBoxCanBeAddToStackLevel(StackLevel stackLevel){
    return stackLevel.isBoxWillBeFit(this._currentBox);
  }

  void _addBoxToStack(){
    for(int i = 0; i < this.levels.length; i++){
      var level = this.levels[i];
      if(this._isBoxCanBeAddToStackLevel(level))
        level.appendBox(this._currentBox);
        this._increaseStackProperties(level);
        break;
    }
  }

  void _increaseStackProperties(StackLevel stackLevel) {
    this._increaseCapacities();
    this._increaseWeights();
    this._increaseDimensions(stackLevel);
  }

  void _increaseCapacities() {
    this.battleAirAssetCapacities
        .tryIncreaseCurrent(this._currentBox.capacities.current);
  }

  void _increaseDimensions(StackLevel stackLevel) {
    if (stackLevel.dimensions.length >= this.dimensions.length)
      this.dimensions.length = stackLevel.dimensions.length;

    if (stackLevel.dimensions.width >= this.dimensions.width)
      this.dimensions.width = stackLevel.dimensions.width;


    if (this.levels.length == 0)
      this.dimensions.height = stackLevel.dimensions.height;

    if (this.levels.length > 0)
      this.dimensions.height =
          this.currentStackLevel * stackLevel.dimensions.height;
  }

  void _increaseWeights() {
    this.weights.gross += this._currentBox.weights.currentGross;
    this.weights.net +=
        this._currentBox.weights.currentGross - this._currentBox.weights.net;
    this.weights.netExplosive += this._currentBox.weights.currentNetExplosive;
  }

  bool _isStackLvlCanBeAdd() {
    return this.levels.length < this.maximumStackLevel;
  }

  StackLevel _copyDefaultStackLevel() {
    return StackLevel(
        dimensions: StackDimensions(
            width: this.defaultStackLevel.dimensions.width,
            height: this.defaultStackLevel.dimensions.height,
            length: this.defaultStackLevel.dimensions.length),
        weights: StackWeights(
            maxGross: this.defaultStackLevel.weights.maxGross,
            maxNet: this.defaultStackLevel.weights.maxNet,
            maxNetExplosion: this.defaultStackLevel.weights.maxNetExplosion),
        capacities:
            Capacities(maximum: this.defaultStackLevel.capacities.maximum));
  }
}
