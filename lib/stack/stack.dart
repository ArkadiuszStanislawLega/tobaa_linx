import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/database/db_stack_levels.dart';
import 'package:tobaa/database/db_stacks.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/weights/stack_weights.dart';

class Stack {
  late int maximumStackLevel;
  late Dimensions dimensions;
  late StackWeights weights;
  late Capacities battleAirAssetCapacities;
  late List<StackLevel> levels;
  late StackLevel defaultStackLevel;

  late Box _currentBox;
  late List<Box> _boxesToAdd;

  Stack.empty() {
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

  Stack.cnu445() {
    this._initialEmptyValues();

    Stack copied = DatabaseStacks.container[BoxType.CNU445]!;
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

  Stack(
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
    var isAddingToCurrentLevelWasSuccessful = this._tryAddBox();

    if (!isAddingToCurrentLevelWasSuccessful) this._tryAddBoxToNewStackLevel();
  }

  bool _isBoxTypeFitToStack() {
    if (this.battleAirAssetCapacities.current == 0) return true;
    var firstStack = this.levels.first;
    var firstBoxInStack = firstStack.boxes.first;
    return firstBoxInStack.type == this._currentBox.type;
  }

  void addAllBoxes(List<Box> boxes) {
    this._boxesToAdd = boxes;
    if (this.isBoxesCanBeAddedToStack(this._boxesToAdd)) {
      this._addBoxToSomeStackLevel();
    }
    // this._currentBox = null;
  }

  void _addBoxToSomeStackLevel() {
    for (int i = 0; i < this._boxesToAdd.length; i++) {
      this._currentBox = this._boxesToAdd[i];
      var isAddingToCurrentLevelWasSuccessful = this._tryAddBox();

      if (!isAddingToCurrentLevelWasSuccessful)
        this._tryAddBoxToNewStackLevel();
    }
  }

  void _tryAddBoxToNewStackLevel() {
    if (this._isNewStackLevelIsAdded()) {
      this._tryAddBox();
    }
  }

  bool _isNewStackLevelIsAdded() {
    bool isStackLevelCanBeAdd = this._isStackLvlCanBeAdd();
    if (isStackLevelCanBeAdd) {
      this.levels.add(this._copyDefaultStackLevel());
      this.dimensions.height += this.defaultStackLevel.dimensions.height;
    }
    return isStackLevelCanBeAdd;
  }

  bool _tryAddBox() {
    bool isFitToStack = this._isFitToStack();
    if (isFitToStack) {
      this._addBoxToStack();
    }
    return isFitToStack;
  }

  int _countCapacitiesWithNewBoxes() {
    int boxesCapacity = 0;
    if (this._boxesToAdd.isNotEmpty) {
      for (int i = 0; i < this._boxesToAdd.length; i++) {
        boxesCapacity += this._boxesToAdd[i].capacities.current;
      }
    }
    return boxesCapacity;
  }

  bool _isNumberOfBaaWillBeFit(int numberOfBaa) {
    return numberOfBaa + battleAirAssetCapacities.current <=
        battleAirAssetCapacities.maximum;
  }

  bool _isFitToStack() {
    bool value = false;
    for (int j = 0; j < this.levels.length; j++) {
      value = this.levels[j].isBoxWillBeFit(this._currentBox);
    }
    return value;
  }

  void _addBoxToStack() {
    for (int i = 0; i < this.levels.length; i++) {
      if (this._isBoxAddedToStack(i)) {
        this._increaseStackProperties(i);
      }
    }
  }

  bool _isBoxAddedToStack(int index) {
    return this.levels[index].tryAppendBox(this._currentBox);
  }

  void _increaseStackProperties(int index) {
    this._increaseCapacities();
    this._increaseWeights();
    this._increaseDimensions(index);
  }

  void _increaseCapacities() {
    this
        .battleAirAssetCapacities
        .tryIncreaseCurrent(this._currentBox.capacities.current);
  }

  void _increaseDimensions(int index) {
    if (this.levels[index].dimensions.length >= this.dimensions.length)
      this.dimensions.length = this.levels[index].dimensions.length;

    if (this.levels[index].dimensions.width >= this.dimensions.width)
      this.dimensions.width = this.levels[index].dimensions.width;

    if (index == 0)
      this.dimensions.height = this.levels[index].dimensions.height;

    if (index > 0)
      this.dimensions.height =
          this.currentStackLevel * this.levels[index].dimensions.height;
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
