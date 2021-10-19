import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/database/db_stack_levels.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/stack/stack.dart';
import 'package:tobaa/weights/stack_weights.dart';

class DatabaseStacks {
  static final Map<BoxType, Stack> container = {
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

    BoxType.CNU609: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(
          maximum: 4
      ),
      defaultStackLevel: DatabaseStackLevels.container[BoxType.CNU609]!,
      weights: StackWeights(
          maxGross: DatabaseStackLevels.container[BoxType.CNU609]!.weights.maxGross,
          maxNet: DatabaseStackLevels.container[BoxType.CNU609]!.weights.maxNet,
          maxNetExplosion: DatabaseStackLevels.container[BoxType.CNU609]!.weights.maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.CNU609]!.dimensions.length,
          width: DatabaseStackLevels.container[BoxType.CNU609]!.dimensions.width,
          height: 1168 // maximum stack level * stack level height
      ),
    ),
    BoxType.CNU445: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(
          maximum: 1
      ),
      defaultStackLevel: DatabaseStackLevels.container[BoxType.CNU445]!,
      weights: StackWeights(
          maxGross: DatabaseStackLevels.container[BoxType.CNU445]!.weights.maxGross,
          maxNet: DatabaseStackLevels.container[BoxType.CNU445]!.weights.maxNet,
          maxNetExplosion: DatabaseStackLevels.container[BoxType.CNU445]!.weights.maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.CNU445]!.dimensions.length,
          width: DatabaseStackLevels.container[BoxType.CNU445]!.dimensions.width,
          height: DatabaseStackLevels.container[BoxType.CNU445]!.dimensions.height // maximum stack level * stack level height
      ),
    ),
    BoxType.CNU614: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(
          maximum: 1
      ),
      defaultStackLevel: DatabaseStackLevels.container[BoxType.CNU614]!,
      weights: StackWeights(
          maxGross: DatabaseStackLevels.container[BoxType.CNU614]!.weights.maxGross,
          maxNet: DatabaseStackLevels.container[BoxType.CNU614]!.weights.maxNet,
          maxNetExplosion: DatabaseStackLevels.container[BoxType.CNU614]!.weights.maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.CNU614]!.dimensions.length,
          width: DatabaseStackLevels.container[BoxType.CNU614]!.dimensions.width,
          height: DatabaseStackLevels.container[BoxType.CNU614]!.dimensions.height // maximum stack level * stack level height
      ),
    ),
    BoxType.CNU672: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(
          maximum: 1
      ),
      defaultStackLevel: DatabaseStackLevels.container[BoxType.CNU672]!,
      weights: StackWeights(
          maxGross: DatabaseStackLevels.container[BoxType.CNU672]!.weights.maxGross,
          maxNet: DatabaseStackLevels.container[BoxType.CNU672]!.weights.maxNet,
          maxNetExplosion: DatabaseStackLevels.container[BoxType.CNU672]!.weights.maxNetExplosion
      ),
      dimensions: StackDimensions(
          length: DatabaseStackLevels.container[BoxType.CNU672]!.dimensions.length,
          width: DatabaseStackLevels.container[BoxType.CNU672]!.dimensions.width,
          height: DatabaseStackLevels.container[BoxType.CNU672]!.dimensions.height // maximum stack level * stack level height
      ),
    ),
  };
}