part of models;

enum Property {
  netWeight,
  grossWeight,
  netExplosiveWeight,
  numberOfBaa,
  numberOfBoxes
}

class Transport {
  late bool isWarTime;
  late List<Car> _cars;
  late Car _currentCar;
  late Car _currentCarToFill;
  late CarType _selectedTypeOfCar;
  late List<Box> _boxesToAdd;
  late BattleAirAsset _battleAirAssetToAdd;
  late Box _boxToAdd;
  late int _currentValueOfBaaToAdd;
  late double _grossWeightOfNewBoxes;
  late double _netExplosiveWeightOfNewPackages;

  int capacity() {
    int value = 0;
    this._cars.forEach((element) {
      value += element.capacity();
    });
    return value;
  }

  Transport() {
    this._initial();
  }

  void _initial() {
    this.isWarTime = false;
    this._cars = [];
    this._selectedTypeOfCar = CarType.test;
    this._boxesToAdd = [];
    this._currentValueOfBaaToAdd = 0;
    this._netExplosiveWeightOfNewPackages = 0;
    this._grossWeightOfNewBoxes = 0;
  }

  List<Car> get cars => _cars;

  int get numberOfCars {
    return this._cars.length;
  }

  int get numberOfBoxes{
    int value = 0;
    this.cars.forEach((car) {
      value += car.numberOfBoxes;
    });
    return value;
  }

  int get numberOfBaa{
    int value = 0;
    this.cars.forEach((car) {
      value += car.numberOfBaa;
    });
    return value;
  }

  int get numberOfIncompleteBoxes{
    int value = 0;
    this.cars.forEach((car) {
      value += car.numberOfIncompleteBoxes;
    });
    return value;
  }

  int get numberOfStacks{
    int value = 0;
    this.cars.forEach((car) {
      value += car.stacks.length;
    });
    return value;
  }

  double get transportNetWeight {
    return this._getDoubleFromCars(Property.netWeight);
  }

  double get transportNetExplosiveWeight {
    return this._getDoubleFromCars(Property.netExplosiveWeight);
  }

  double get transportGrossWeight {
    return this._getDoubleFromCars(Property.grossWeight);
  }

  double _getDoubleFromStack(Property property) {
    double value = 0.0;
    for (int j = 0; j < this._currentCar.stacks.length; j++) {
      var currentStack = this._currentCar.stacks[j];

      switch (property) {
        case Property.netWeight:
          value += currentStack.weights.net;
          break;
        case Property.grossWeight:
          value += currentStack.weights.gross;
          break;
        case Property.netExplosiveWeight:
          value += currentStack.weights.netExplosive;
          break;
      }
    }
    return value;
  }

  double _getDoubleFromCars(Property property) {
    double value = 0;
    for (int i = 0; i < this._cars.length; i++) {
      this._currentCar = this._cars[i];
      value += this._getDoubleFromStack(property);
    }
    // this._currentCar = new Car();
    return value;
  }

  CarType get selectedCar => this._selectedTypeOfCar;

  set selectedCar(CarType value) {
    this._selectedTypeOfCar = value;
  }

  void createTransport(Map<BattleAirAssetType, int> map) {
    this.clear();
    map.forEach((key, value) => this._addBattleAirAssetType(key, value));
  }

  void clear() {
    this._cars.clear();
    this._boxesToAdd.clear();
    this._currentValueOfBaaToAdd = 0;
    this._grossWeightOfNewBoxes = 0;
    this._netExplosiveWeightOfNewPackages = 0;
  }

  void _addBattleAirAssetType(BattleAirAssetType type, int value) {
    if (value > 0) {
      this._currentValueOfBaaToAdd = value;
      this._battleAirAssetToAdd = DatabaseAssets.container[type]!;

      this._prepareBoxesToSpendOnCars();
      this._spendBoxesToCars();
    }
  }

  void _prepareBoxesToSpendOnCars() {
    do {
      this._boxToAdd = this._copyBoxFromDB(this._battleAirAssetToAdd.boxType);
      this._fillBox();
      this._boxesToAdd.add(this._boxToAdd);
    } while (this._currentValueOfBaaToAdd > 0);
  }

  Box _copyBoxFromDB(BoxType boxType) {
    Box modelBox = DatabaseBoxes.container[boxType]!;
    return new Box(
        name: modelBox.name,
        capacities: Capacities(maximum: modelBox.capacities.maximum),
        weights: BoxWeights(
            gross: modelBox.weights.gross,
            net: modelBox.weights.net,
            netExplosive: modelBox.weights.netExplosive),
        dimensions: Dimensions(
            height: modelBox.dimensions.height,
            width: modelBox.dimensions.width,
            length: modelBox.dimensions.length),
        maxStackLevel: modelBox.maxStackLevel,
        battleAirAsset: modelBox.battleAirAsset,
        type: modelBox.type,
    coordinates: modelBox.coordinates);
  }

  void _fillBox() {
    this._fillBoxWithCertainValue();
    this._fillBoxToMax();
  }

  void _fillBoxWithCertainValue() {
    if (this._isValueLowerThenMaxCapacityOfTheBox()) {
      this._boxToAdd.fillBox(this._currentValueOfBaaToAdd);
      this._currentValueOfBaaToAdd = 0;
    }
  }

  bool _isValueLowerThenMaxCapacityOfTheBox() {
    return this._currentValueOfBaaToAdd < this._boxToAdd.capacities.maximum;
  }

  void _fillBoxToMax() {
    if (this._isValueHigherThenMaxCapacityOfTheBox()) {
      this._boxToAdd.fillToMaximum();
      this._currentValueOfBaaToAdd -= this._boxToAdd.capacities.maximum;
    }
  }

  bool _isValueHigherThenMaxCapacityOfTheBox() {
    return this._currentValueOfBaaToAdd >= this._boxToAdd.capacities.maximum;
  }

  void _spendBoxesToCars() {
    this._spendToCarInWarTime();
    this._spendToCarInPeaceTime();
    this._boxesToAdd.clear();
  }

  void _spendToCarInWarTime() {
    if (this.isWarTime) {
      if (!this._isAddedBoxToAnIncompleteCarWarTime()) {
        this._spendBoxesToNewCarWarTime();
      }
    }
  }

  bool _isAddedBoxToAnIncompleteCarWarTime() {
    bool isBoxesFit = false;
    for (int i = 0; i < this._cars.length; i++) {
      this._currentCarToFill = this._cars[i];

      isBoxesFit = this._currentCarToFill.isBoxesWillFit(this._boxesToAdd);
      if (isBoxesFit) {
        this._currentCarToFill.addBoxes(this._boxesToAdd);
        break;
      }
    }
    return isBoxesFit;
  }

  void _spendBoxesToNewCarWarTime() {
    //TODO: Przetestować
    if (this._copyCarFromDB().isBoxesWillFit(this._boxesToAdd)) {
      this.addCar();
      this._cars.last.addBoxes(this._boxesToAdd);
    }
  }

  void addCar() {
    this._cars.add(this._copyCarFromDB());
  }

  void _spendToCarInPeaceTime() {
    if (!this.isWarTime) {
      for (int i = 0; i < this._boxesToAdd.length; i++) {
        this._boxToAdd = this._boxesToAdd[i];
        if (!this._isAddedBoxToAnIncompleteCarPeaceTime()) {
          this._spendBoxesToNewCarPeaceTime();
        }
      }
    }
  }

  bool _isAddedBoxToAnIncompleteCarPeaceTime() {
    bool isBoxFit = false;
    bool isBoxFitInThePeacetimeLimits = false;
    for (int i = 0; i < this._cars.length; i++) {
      this._currentCarToFill = this._cars[i];

      isBoxFit = this._currentCarToFill.isBoxWillFit(this._boxToAdd);
      isBoxFitInThePeacetimeLimits = this.isBoxInPeacetimeLimit();

      if (isBoxFit && isBoxFitInThePeacetimeLimits) {
        this._currentCarToFill.addBox(this._boxToAdd);
        break;
      }
    }

    return isBoxFit && isBoxFitInThePeacetimeLimits;
  }

  bool isBoxInPeacetimeLimit() {
    this._countTheWightOfTheChestToAdd();
    return this._isMetLimitNetExplosiveWeightOfTheLoad();
  }

  void _countTheWightOfTheChestToAdd() {
    BoxWeights boxWeights = this._boxToAdd.weights;
    this._grossWeightOfNewBoxes += boxWeights.currentGross;
    this._netExplosiveWeightOfNewPackages += boxWeights.currentNetExplosive;
  }

  bool _isMetLimitNetExplosiveWeightOfTheLoad() {
    if (this._isCurrentCarHasNotExplosionClassAssigned()) return true;

    double carNetExplosiveWithNewBoxes =
        this._currentCarToFill.weightOfLoadingArea.currentNetExplosive +
            this._netExplosiveWeightOfNewPackages;

    this._netExplosiveWeightOfNewPackages = 0;
    return carNetExplosiveWithNewBoxes <=
        this._currentCarToFill.explosionClass.weightLimit;
  }

  void _spendBoxesToNewCarPeaceTime() {
    if (this._copyCarFromDB().isBoxWillFit(this._boxToAdd)) {
      this.addCar();
      this._cars.last.addBox(this._boxToAdd);
    }
  }

  Car _copyCarFromDB() {
    Car dbCar = DatabaseCars.container[this._selectedTypeOfCar]!;
    return Car(
      weightOfLoadingArea: LoadingAreaWeights(
          maximum: dbCar.weightOfLoadingArea.maximum,
          maximumNetExplosive: dbCar.weightOfLoadingArea.maximumNetExplosive),
      type: CarType.smallCarTest,
      carWeights:
          Weights(gross: dbCar.carWeights.gross, net: dbCar.carWeights.net),
      name: dbCar.name,
      stacks: [],
      dimensionOfLoadingArea: LoadingAreaDimensions(
          height: dbCar.dimensionOfLoadingArea.height,
          length: dbCar.dimensionOfLoadingArea.length,
          width: dbCar.dimensionOfLoadingArea.width),
    );
  }

  bool _isCurrentCarHasNotExplosionClassAssigned() {
    return this._currentCarToFill.explosionClass.explosionSubclass.id == 0;
  }
}
