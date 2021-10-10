import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/database/db_stack_levels.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/stack/stack.dart';
import 'package:tobaa/weights/stack_weights.dart';

class DatabaseStacks {
  static const int MAX_TEST_STACK_LEVEL = 3;
  static const int MAX_OVERSIZE_TEST_STACK_LEVEL = 3;
  static const int MAX_CORRECT_SIZE_TEST_STACK_LEVEL = 3;
  static const int MAX_HEAVY_TEST_STACK_LEVEL = 3;
  static final Map<BoxType, Stack> container = {
    BoxType.test: Stack(
      maximumStackLevel: MAX_TEST_STACK_LEVEL,
      battleAirAssetCapacities: Capacities(
          maximum: MAX_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.test]!.capacities.maximum),
      defaultStackLevel: DatabaseStackLevels.container[BoxType.test]!,
      weights: StackWeights(
          maxGross: MAX_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.test]!.weights.maxGross,
          maxNet: MAX_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.test]!.weights.maxNet,
          maxNetExplosion: MAX_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.test]!.weights
                  .maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.test]!.dimensions
              .length,
          width: MAX_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.test]!.dimensions.width,
          height: MAX_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.test]!.dimensions.height
      ),
    ),
    BoxType.oversizeTest: Stack(
      maximumStackLevel: MAX_OVERSIZE_TEST_STACK_LEVEL,
      battleAirAssetCapacities: Capacities(
          maximum: MAX_OVERSIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.oversizeTest]!.capacities
                  .maximum),
      defaultStackLevel: DatabaseStackLevels.container[BoxType.oversizeTest]!,
      weights: StackWeights(
          maxGross: MAX_OVERSIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.oversizeTest]!.weights
                  .maxGross,
          maxNet: MAX_OVERSIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.oversizeTest]!.weights
                  .maxNet,
          maxNetExplosion: MAX_OVERSIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.oversizeTest]!.weights
                  .maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.oversizeTest]!
              .dimensions.length,
          width: MAX_OVERSIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.oversizeTest]!.dimensions
                  .width,
          height: MAX_OVERSIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.oversizeTest]!.dimensions
                  .height
      ),
    ),
    BoxType.correctSizeTest: Stack(
      maximumStackLevel: MAX_CORRECT_SIZE_TEST_STACK_LEVEL,
      battleAirAssetCapacities: Capacities(
          maximum: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.correctSizeTest]!.capacities
                  .maximum),
      defaultStackLevel: DatabaseStackLevels.container[BoxType
          .correctSizeTest]!,
      weights: StackWeights(
          maxGross: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.correctSizeTest]!.weights
                  .maxGross,
          maxNet: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.correctSizeTest]!.weights
                  .maxNet,
          maxNetExplosion: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.correctSizeTest]!.weights
                  .maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.correctSizeTest]!
              .dimensions.length,
          width: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.correctSizeTest]!.dimensions
                  .width,
          height: MAX_CORRECT_SIZE_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.correctSizeTest]!.dimensions
                  .height
      ),
    ),
    BoxType.heavyTest: Stack(
      maximumStackLevel: MAX_HEAVY_TEST_STACK_LEVEL,
      battleAirAssetCapacities: Capacities(
          maximum: MAX_HEAVY_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.heavyTest]!.capacities
                  .maximum),
      defaultStackLevel: DatabaseStackLevels.container[BoxType.heavyTest]!,
      weights: StackWeights(
          maxGross: MAX_HEAVY_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.heavyTest]!.weights
                  .maxGross,
          maxNet: MAX_HEAVY_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.heavyTest]!.weights.maxNet,
          maxNetExplosion: MAX_HEAVY_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.heavyTest]!.weights
                  .maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.heavyTest]!.dimensions
              .length,
          width: MAX_HEAVY_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.heavyTest]!.dimensions
                  .width,
          height: MAX_HEAVY_TEST_STACK_LEVEL *
              DatabaseStackLevels.container[BoxType.heavyTest]!.dimensions
                  .height
      ),
    ),
    BoxType.CNU431: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(
          maximum: 4
      ),
      defaultStackLevel: DatabaseStackLevels.container[BoxType.CNU431]!,
      weights: StackWeights(
          maxGross: DatabaseStackLevels.container[BoxType.CNU431]!.weights.maxGross,
          maxNet: DatabaseStackLevels.container[BoxType.CNU431]!.weights.maxNet,
          maxNetExplosion: DatabaseStackLevels.container[BoxType.CNU431]!.weights.maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.CNU431]!.dimensions.length,
          width: DatabaseStackLevels.container[BoxType.CNU431]!.dimensions.width,
          height: 960 // maximum stack level * stack level height
      ),
    ),

  };
}