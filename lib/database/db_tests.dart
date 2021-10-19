import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/dimensions/loading_area_dimensions.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/stack/stack.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/weights/box_weights.dart';
import 'package:tobaa/weights/loading_area_weights.dart';
import 'package:tobaa/weights/stack_weights.dart';
import 'package:tobaa/weights/weights.dart';

import 'db_assets.dart';
import 'db_compatibility_group.dart';
import 'db_explosion_subclasses.dart';

class DatabaseTests {
  static const int MAX_TEST_STACK_LEVEL = 3;
  static const int MAX_OVERSIZE_TEST_STACK_LEVEL = 3;
  static const int MAX_CORRECT_SIZE_TEST_STACK_LEVEL = 3;
  static const int MAX_HEAVY_TEST_STACK_LEVEL = 3;

  static final Map<CarType, Car> carContainer = {
    CarType.test: Car(
      weightOfLoadingArea:
          LoadingAreaWeights(maximum: 200000, maximumNetExplosive: 200000),
      type: CarType.test,
      carWeights: Weights(gross: 1, net: 1),
      name: 'Test car',
      stacks: [],
      dimensionOfLoadingArea:
          LoadingAreaDimensions(height: 10, length: 100, width: 50),
    ),
    CarType.smallCarTest: Car(
      weightOfLoadingArea:
          LoadingAreaWeights(maximum: 6.0, maximumNetExplosive: 1.5),
      type: CarType.smallCarTest,
      carWeights: Weights(gross: 1, net: 1),
      name: 'Small car test',
      stacks: [],
      dimensionOfLoadingArea:
          LoadingAreaDimensions(height: 6, length: 5, width: 6),
    ),
  };

  static Map<BattleAirAssetType, BattleAirAsset> assetsContainer = {
    BattleAirAssetType.test: BattleAirAsset(
        type: BattleAirAssetType.test,
        boxType: BoxType.test,
        name: "test baa",
        weights: Weights(gross: 1, netExplosive: 0.5, net: 1),
        dimensions: Dimensions(height: 1, length: 5, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.A]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)),
    BattleAirAssetType.heavyTest: BattleAirAsset(
        type: BattleAirAssetType.heavyTest,
        boxType: BoxType.heavyTest,
        name: "test baa",
        weights: Weights(gross: 150000, netExplosive: 0.5, net: 150001),
        dimensions: Dimensions(height: 1, length: 5, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.B]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)),
    BattleAirAssetType.oversizeTest: BattleAirAsset(
        type: BattleAirAssetType.oversizeTest,
        boxType: BoxType.oversizeTest,
        name: "test baa",
        weights: Weights(gross: 150000, netExplosive: 0.5, net: 150001),
        dimensions: Dimensions(height: 1, length: 5, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.C]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!)),
  };
  static final Map<BoxType, Box> boxContainer = {
    BoxType.test: Box(
      type: BoxType.test,
      name: "test box",
      capacities: Capacities(maximum: 10),
      dimensions: Dimensions(width: 11, length: 7, height: 2),
      weights: BoxWeights(gross: 11, net: 1, netExplosive: 5),
      battleAirAsset: DatabaseAssets.container[BattleAirAssetType.test]!,
    ),
    BoxType.oversizeTest: Box(
        type: BoxType.oversizeTest,
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        dimensions: Dimensions(width: 7, length: 7, height: 7),
        weights: BoxWeights(gross: 2.0, net: 1.0, netExplosive: 0.5),
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.test]!,
        maxStackLevel: 2),
    BoxType.correctSizeTest: Box(
        type: BoxType.correctSizeTest,
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        dimensions: Dimensions(width: 1, length: 5, height: 10),
        weights: BoxWeights(gross: 2.0, net: 1.0, netExplosive: 0.5),
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.test]!,
        maxStackLevel: 2),
    BoxType.heavyTest: Box(
        type: BoxType.heavyTest,
        name: "Box with new Baa",
        capacities: Capacities(maximum: 10),
        dimensions: Dimensions(width: 1, length: 5, height: 1),
        weights: BoxWeights(gross: 1500001, net: 1500000, netExplosive: 0.5),
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.test]!,
        maxStackLevel: 2),
  };
  static Map<BoxType, StackLevel> stackLevelContainer = {
    BoxType.test: StackLevel(
      dimensions: StackDimensions(height: 2, width: 33, length: 7),
      weights: StackWeights(maxNet: 3, maxGross: 33, maxNetExplosion: 15),
      capacities: Capacities(maximum: 30),
    ),
    BoxType.oversizeTest: StackLevel(
      dimensions: StackDimensions(height: 7, width: 7, length: 7),
      weights: StackWeights(maxNet: 3, maxGross: 6, maxNetExplosion: 1.5),
      capacities: Capacities(maximum: 30),
    ),
    BoxType.correctSizeTest: StackLevel(
      dimensions: StackDimensions(height: 1, width: 1, length: 5),
      weights: StackWeights(maxNet: 3, maxGross: 6, maxNetExplosion: 1.5),
      capacities: Capacities(maximum: 30),
    ),
    BoxType.heavyTest: StackLevel(
      dimensions: StackDimensions(height: 1, width: 1, length: 5),
      weights: StackWeights(maxNet: 3, maxGross: 450000, maxNetExplosion: 1.5),
      capacities: Capacities(maximum: 30),
    ),
  };
  static final Map<BoxType, Stack> stackContainer = {
    BoxType.test: Stack(
      maximumStackLevel: MAX_TEST_STACK_LEVEL,
      battleAirAssetCapacities: Capacities(
          maximum: MAX_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.test]!.capacities.maximum),
      defaultStackLevel: stackLevelContainer[BoxType.test]!,
      weights: StackWeights(
          maxGross: MAX_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.test]!.weights.maxGross,
          maxNet: MAX_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.test]!.weights.maxNet,
          maxNetExplosion: MAX_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.test]!.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: stackLevelContainer[BoxType.test]!.dimensions.length,
          width: MAX_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.test]!.dimensions.width,
          height: MAX_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.test]!.dimensions.height),
    ),
    BoxType.oversizeTest: Stack(
      maximumStackLevel: MAX_OVERSIZE_TEST_STACK_LEVEL,
      battleAirAssetCapacities: Capacities(
          maximum: MAX_OVERSIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.oversizeTest]!.capacities.maximum),
      defaultStackLevel: stackLevelContainer[BoxType.oversizeTest]!,
      weights: StackWeights(
          maxGross: MAX_OVERSIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.oversizeTest]!.weights.maxGross,
          maxNet: MAX_OVERSIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.oversizeTest]!.weights.maxNet,
          maxNetExplosion: MAX_OVERSIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.oversizeTest]!
                  .weights
                  .maxNetExplosion),
      dimensions: StackDimensions(
          length: stackLevelContainer[BoxType.oversizeTest]!.dimensions.length,
          width: MAX_OVERSIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.oversizeTest]!.dimensions.width,
          height: MAX_OVERSIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.oversizeTest]!.dimensions.height),
    ),
    BoxType.correctSizeTest: Stack(
      maximumStackLevel: MAX_CORRECT_SIZE_TEST_STACK_LEVEL,
      battleAirAssetCapacities: Capacities(
          maximum: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.correctSizeTest]!.capacities.maximum),
      defaultStackLevel: stackLevelContainer[BoxType.correctSizeTest]!,
      weights: StackWeights(
          maxGross: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.correctSizeTest]!.weights.maxGross,
          maxNet: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.correctSizeTest]!.weights.maxNet,
          maxNetExplosion: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.correctSizeTest]!
                  .weights
                  .maxNetExplosion),
      dimensions: StackDimensions(
          length:
              stackLevelContainer[BoxType.correctSizeTest]!.dimensions.length,
          width: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.correctSizeTest]!.dimensions.width,
          height: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.correctSizeTest]!.dimensions.height),
    ),
    BoxType.heavyTest: Stack(
      maximumStackLevel: MAX_HEAVY_TEST_STACK_LEVEL,
      battleAirAssetCapacities: Capacities(
          maximum: MAX_HEAVY_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.heavyTest]!.capacities.maximum),
      defaultStackLevel: stackLevelContainer[BoxType.heavyTest]!,
      weights: StackWeights(
          maxGross: MAX_HEAVY_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.heavyTest]!.weights.maxGross,
          maxNet: MAX_HEAVY_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.heavyTest]!.weights.maxNet,
          maxNetExplosion: MAX_HEAVY_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.heavyTest]!.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: stackLevelContainer[BoxType.heavyTest]!.dimensions.length,
          width: MAX_HEAVY_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.heavyTest]!.dimensions.width,
          height: MAX_HEAVY_TEST_STACK_LEVEL *
              stackLevelContainer[BoxType.heavyTest]!.dimensions.height),
    ),
  };
}
