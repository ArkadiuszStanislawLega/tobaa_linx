import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/weights/stack_weights.dart';

class DatabaseStackLevels {
  static Map<BoxType, StackLevel> container = {
    BoxType.CNU431: StackLevel(
      dimensions: StackDimensions(
          height: 480,
          width: 968,
          length: 4416
      ),
      weights: StackWeights(
        net: 281000.0,
        gross: 28100.0,
        netExplosive: 0,
        maxNet: 281000.0,
        maxGross: 927000.0,
        maxNetExplosion: 232800.0,
      ),
      capacities: Capacities(
          maximum: 4
      ),
    ),

    BoxType.CNU609: StackLevel(
      dimensions: StackDimensions(
          height: 584,
          width: 1067,
          length: 3505
      ),
      weights: StackWeights(
        net: 283495.0,
        gross: 283495.0,
        netExplosive: 0,
        maxNet: 283495.0,
        maxGross: 623495.0,
        maxNetExplosion: 123200.0,
      ),
      capacities: Capacities(
          maximum: 4
      ),
    ),
  };
}