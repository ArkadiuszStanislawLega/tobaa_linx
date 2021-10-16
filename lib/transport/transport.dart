import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/dimensions/loading_area_dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/weights/box_weights.dart';
import 'package:tobaa/weights/loading_area_weights.dart';
import 'package:tobaa/weights/weights.dart';

enum Property{
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

  static Map<CarType, LoadingAreaWeights> _carWeightLimits = {};

  int capacity(){
    int value = 0;
    this._cars.forEach((element) {value+=element.capacity();});
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

    this._createCarsWeightLimits();
  }

  void _createCarsWeightLimits(){
    _carWeightLimits[CarType.test] = new LoadingAreaWeights(
        maximum: 10000.0,
        maximumNetExplosive: 10000.0
    );
  }



  List<Car> get cars => _cars;

  int get numberOfCars {
    return this._cars.length;
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

  void clear(){
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
      this._boxToAdd = this._createBox(this._battleAirAssetToAdd.boxType);
      this._fillBox();
      this._boxesToAdd.add(this._boxToAdd);
    } while (this._currentValueOfBaaToAdd > 0);
  }

  Box _createBox(BoxType boxType) {
    Box modelBox = DatabaseBoxes.container[boxType]!;
    return new Box(
      name: modelBox.name,
        capacities: Capacities(maximum: modelBox.capacities.maximum),
        weights: BoxWeights(
            gross: modelBox.weights.gross,
            net: modelBox.weights.net,
            netExplosive: modelBox.weights.netExplosive
        ),
        dimensions: Dimensions(
          height: modelBox.dimensions.height,
          width: modelBox.dimensions.width,
          length: modelBox.dimensions.length
        ),
      maxStackLevel: modelBox.maxStackLevel,
      battleAirAsset: modelBox.battleAirAsset,
      type: modelBox.type
    );
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
  }

  void _spendToCarInWarTime(){
    if(this.isWarTime){
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
    var car = DatabaseCars.container[this._selectedTypeOfCar];
    if (car!.isBoxesWillFit(this._boxesToAdd)) {
      this.addCar(this._selectedTypeOfCar);
      this._cars.last.addBoxes(this._boxesToAdd);
    }
  }

  void addCar(CarType carType) {
    this._cars.add(this._createCar());
  }

  void _spendToCarInPeaceTime() {
    if (!this.isWarTime) {
      if (!this._isAddedBoxToAnIncompleteCarPeaceTime()) {
        this._spendBoxesToNewCarPeaceTime();
      }
    }
  }

  bool _isAddedBoxToAnIncompleteCarPeaceTime(){
    bool isBoxesFit = false;
    bool isBoxesFitInThePeacetimeLimits = false;

    for (int i = 0; i < this._cars.length; i++) {

      this._currentCarToFill = this._cars[i];

      isBoxesFit = this._currentCarToFill.isBoxesWillFit(this._boxesToAdd);
      isBoxesFitInThePeacetimeLimits = this.isBoxInPeacetimeLimit();

      if (isBoxesFit && isBoxesFitInThePeacetimeLimits) {
        this._currentCarToFill.addBoxes(this._boxesToAdd);
        break;
      }
    }
    return isBoxesFit && isBoxesFitInThePeacetimeLimits;
  }


  bool isBoxInPeacetimeLimit() {
    this._countTheWightOfTheChestToAdd();
    return this._isMetLimitNetExplosiveWeightOfTheLoad();
  }

  void _countTheWightOfTheChestToAdd(){
    for (int i = 0; i < this._boxesToAdd.length; i++) {
      BoxWeights boxWeights = this._boxesToAdd[i].weights;
      this._grossWeightOfNewBoxes += boxWeights.currentGross;
      this._netExplosiveWeightOfNewPackages += boxWeights.currentNetExplosive;
    }
  }

  bool _isMetLimitNetExplosiveWeightOfTheLoad(){
    if (this._isCurrentCarHasNotExplosionClassAssigned())
      return true;

    double currentNetExplosiveWeightOfTheLoad = this._currentCarToFill
        .weightOfLoadingArea.currentNetExplosive;

    double carNetExplosiveWithNewBoxes =
        currentNetExplosiveWeightOfTheLoad + this._netExplosiveWeightOfNewPackages;

    return carNetExplosiveWithNewBoxes <= this._currentCarToFill.explosionClass.weightLimit;
  }

  void _spendBoxesToNewCarPeaceTime(){
    if (this._createCar().isBoxesWillFit(this._boxesToAdd)) {
      this.addCar(this._selectedTypeOfCar);
      this._cars.last.addBoxes(this._boxesToAdd);
    }

  }

  Car _createCar(){
    Car dbCar = DatabaseCars.container[this._selectedTypeOfCar]!;
    return Car(
      weightOfLoadingArea: LoadingAreaWeights(
        maximum: dbCar.weightOfLoadingArea.maximum,
        maximumNetExplosive: dbCar.weightOfLoadingArea.maximumNetExplosive
    ),
      type: CarType.smallCarTest,
      carWeights: Weights(
          gross: dbCar.carWeights.gross,
          net: dbCar.carWeights.net
      ),
      name: dbCar.name,
      stacks: [],
      dimensionOfLoadingArea: LoadingAreaDimensions(
          height: dbCar.dimensionOfLoadingArea.height,
          length: dbCar.dimensionOfLoadingArea.length,
          width: dbCar.dimensionOfLoadingArea.width
      ),
    );
  }

  bool _isCurrentCarHasNotExplosionClassAssigned(){
      return this._currentCarToFill.explosionClass.explosionSubclass.id == 0;
  }



}