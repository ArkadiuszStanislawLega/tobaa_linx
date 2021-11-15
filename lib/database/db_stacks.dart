import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/database/db_stack_levels.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/stack/stack.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/weights/stack_weights.dart';

class DatabaseStacks {
  static final StackLevel _cnu431 =
      DatabaseStackLevels.container[BoxType.CNU431]!;
  static final StackLevel _cnu609 =
      DatabaseStackLevels.container[BoxType.CNU609]!;
  static final StackLevel _cnu445 =
      DatabaseStackLevels.container[BoxType.CNU445]!;
  static final StackLevel _cnu614 =
      DatabaseStackLevels.container[BoxType.CNU614]!;
  static final StackLevel _cnu672 =
      DatabaseStackLevels.container[BoxType.CNU672]!;
  static final StackLevel _m54TPRRR =
      DatabaseStackLevels.container[BoxType.M548_TPRRR]!;
  static final Map<BoxType, Stack> container = {
    BoxType.CNU431: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 4),
      defaultStackLevel: _cnu431,
      weights: StackWeights(
          maxGross: _cnu431.weights.maxGross,
          maxNet: _cnu431.weights.maxNet,
          maxNetExplosion: _cnu431.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cnu431.dimensions.length,
          width: _cnu431.dimensions.width,
          height: 960 // maximum stack level * stack level height
          ),
    ),
    BoxType.CNU609: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 4),
      defaultStackLevel: _cnu609,
      weights: StackWeights(
          maxGross: _cnu609.weights.maxGross,
          maxNet: _cnu609.weights.maxNet,
          maxNetExplosion: _cnu609.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cnu609.dimensions.length,
          width: _cnu609.dimensions.width,
          height: 1168 // maximum stack level * stack level height
          ),
    ),
    BoxType.CNU445: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 1),
      defaultStackLevel: _cnu445,
      weights: StackWeights(
          maxGross: _cnu445.weights.maxGross,
          maxNet: _cnu445.weights.maxNet,
          maxNetExplosion: _cnu445.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cnu445.dimensions.length,
          width: _cnu445.dimensions.width,
          height: 1524 // maximum stack level * stack level height
          ),
    ),
    BoxType.CNU614: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 1),
      defaultStackLevel: _cnu614,
      weights: StackWeights(
          maxGross: _cnu614.weights.maxGross,
          maxNet: _cnu614.weights.maxNet,
          maxNetExplosion: _cnu614.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cnu614.dimensions.length,
          width: _cnu614.dimensions.width,
          height: _cnu614
              .dimensions.height // maximum stack level * stack level height
          ),
    ),
    BoxType.CNU672: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 1),
      defaultStackLevel: _cnu672,
      weights: StackWeights(
          maxGross: _cnu672.weights.maxGross,
          maxNet: _cnu672.weights.maxNet,
          maxNetExplosion: _cnu672.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cnu672.dimensions.length,
          width: _cnu672.dimensions.width,
          height: _cnu672
              .dimensions.height // maximum stack level * stack level height
          ),
    ),
    BoxType.M548_TPRRR: Stack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 1800),
      defaultStackLevel: _m54TPRRR,
      weights: StackWeights(
          maxGross: _m54TPRRR.weights.maxGross,
          maxNet: _m54TPRRR.weights.maxNet,
          maxNetExplosion: _m54TPRRR.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _m54TPRRR.dimensions.length,
          width: _m54TPRRR.dimensions.width,
          height: _m54TPRRR
              .dimensions.height // maximum stack level * stack level height
          ),
    ),
  };
}
