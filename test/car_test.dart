import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/weights/box_weights.dart';

void main() {
  test("Add boxes with baa to car war time", () {


    const int DIMENSIONS_ONE_STACK_LEVEL_CAPACITY = 45;
    const double MAXIMUM_GROSS_WEIGHT = 6.0;
    const double MAXIMUM_NET_EXPLOSIVE_WEIGHT = 1.5;
    const double GROSS_WEIGHT_OF_THE_TWO_BOXES = 4.0;
    const double NET_EXPLOSIVE_WEIGHT_WITH_TWO_BOXES = 1.0;

    List<Box> twoOversizeBoxes = [];
    List<Box> twoBoxes = [];
    List<Box> oneBox = [];

    Car car = DatabaseCars.container[CarType.smallCarTest]!;
    Box boxWithCorrectSize = DatabaseBoxes.container[BoxType.correctSizeTest]!;
    Box boxWithToBigSizes = DatabaseBoxes.container[BoxType.oversizeTest]!;

    expect(car.weightOfLoadingArea.current, GROSS_WEIGHT_OF_THE_TWO_BOXES);

    boxWithCorrectSize.fillToMaximum();

    // Put to big box.
    twoOversizeBoxes.add(boxWithToBigSizes);
    car.addBoxes(twoOversizeBoxes);

    expect(car.weightOfLoadingArea.current, 0);
    expect(car.weightOfLoadingArea.currentNetExplosive, 0);
    expect(car.dimensionOfLoadingArea.occupied.capacity, 0);

    // Put two correct sized boxes to car.
    twoBoxes.add(boxWithCorrectSize);
    twoBoxes.add(boxWithCorrectSize);
    car.addBoxes(twoBoxes);

    expect(car.weightOfLoadingArea.current, GROSS_WEIGHT_OF_THE_TWO_BOXES);
    expect(car.weightOfLoadingArea.currentNetExplosive,
        NET_EXPLOSIVE_WEIGHT_WITH_TWO_BOXES);
    expect(car.dimensionOfLoadingArea.occupied.capacity,
        DIMENSIONS_ONE_STACK_LEVEL_CAPACITY);

    // Fill car to maximum, when added one box more.
    oneBox.add(boxWithCorrectSize);
    car.addBoxes(oneBox);

    expect(car.weightOfLoadingArea.current, MAXIMUM_GROSS_WEIGHT);
    expect(car.weightOfLoadingArea.currentNetExplosive,
        MAXIMUM_NET_EXPLOSIVE_WEIGHT);
    expect(car.dimensionOfLoadingArea.occupied.capacity,
        DIMENSIONS_ONE_STACK_LEVEL_CAPACITY);

    // Every value of the boxes added to the car overloads it and every values doesn't change.
    car.addBoxes(twoBoxes);
    expect(car.weightOfLoadingArea.current, MAXIMUM_GROSS_WEIGHT);
    expect(car.weightOfLoadingArea.currentNetExplosive,
        MAXIMUM_NET_EXPLOSIVE_WEIGHT);
    expect(car.dimensionOfLoadingArea.occupied.capacity,
        DIMENSIONS_ONE_STACK_LEVEL_CAPACITY);
  });


  test("Is boxes can be add", () {
    Car car = DatabaseCars.container[CarType.test]!;
    Box boxWithCorrectSize = DatabaseBoxes.container[BoxType
        .correctSizeTest]!;
    Box boxWithIncorrectExplosionClass = DatabaseBoxes.container[BoxType
        .heavyTest]!;

    boxWithCorrectSize.fillToMaximum();
    boxWithIncorrectExplosionClass.fillToMaximum();

    List<Box> boxes = [boxWithCorrectSize, boxWithCorrectSize];

    var answerTrue = car.isBoxesWillFit(boxes);
    expect(answerTrue, true);

    car.addBoxes(boxes);
    boxes.clear();
    boxes.add(boxWithIncorrectExplosionClass);
    var answerFalse = car.isBoxesWillFit(boxes);
    expect(answerFalse, false);
  });

  test("Add to euro-cargo", () {
    Car car = DatabaseCars.container[CarType.euro_cargo]!;
    Box box = new Box(
        name: "CNU-431",
        capacities: Capacities(
            maximum: 4
        ),
        weights: BoxWeights(
            gross: 927000,
            net: 281000,
            netExplosive: 232800
        ),
        dimensions: Dimensions(
            height: 480,
            width: 968,
            length: 4416
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM120]!,
        type: BoxType.CNU431
    );

    Box box2 = new Box(
        name: "CNU-431",
        capacities: Capacities(
            maximum: 4
        ),
        weights: BoxWeights(
            gross: 927000,
            net: 281000,
            netExplosive: 232800
        ),
        dimensions: Dimensions(
            height: 480,
            width: 968,
            length: 4416
        ),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM120]!,
        type: BoxType.CNU431
    );

    box.capacities.fillToMaximum();
    box2.capacities.tryIncreaseCurrent(3);

    List<Box> boxes = [box, box2];

    car.addBoxes(boxes);

    expect(car.capacity(), 7);
  });

}