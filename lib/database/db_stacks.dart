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

  };
}