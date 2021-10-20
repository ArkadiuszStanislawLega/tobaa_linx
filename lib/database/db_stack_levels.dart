import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/weights/stack_weights.dart';

class DatabaseStackLevels {
  static Map<BoxType, StackLevel> container = {
    BoxType.CNU431: StackLevel(
      dimensions: StackDimensions(height: 480, width: 968, length: 4416),
      weights: StackWeights(
        net: 281000.0,
        gross: 28100.0,
        netExplosive: 0,
        maxNet: 281000.0,
        maxGross: 927000.0,
        maxNetExplosion: 232800.0,
      ),
      capacities: Capacities(maximum: 4),
    ),
    BoxType.CNU609: StackLevel(
      dimensions: StackDimensions(height: 584, width: 1067, length: 3505),
      weights: StackWeights(
        net: 283495.0,
        gross: 283495.0,
        netExplosive: 0,
        maxNet: 283495.0,
        maxGross: 623495.0,
        maxNetExplosion: 123200.0,
      ),
      capacities: Capacities(maximum: 4),
    ),
    BoxType.CNU445: StackLevel(
      dimensions: StackDimensions(height: 762, width: 1016, length: 2743),
      weights: StackWeights(
        net: 197313.0,
        gross: 503413.0,
        netExplosive: 65500,
        maxNet: 197313.0,
        maxGross: 503413.0,
        maxNetExplosion: 65500.0,
      ),
      capacities: Capacities(maximum: 1),
    ),
    BoxType.CNU614: StackLevel(
      dimensions: StackDimensions(height: 940, width: 990, length: 4572),
      weights: StackWeights(
        net: 197313.0,
        gross: 1172513.0,
        netExplosive: 108860,
        maxNet: 197313.0,
        maxGross: 1172513.0,
        maxNetExplosion: 108860.0,
      ),
      capacities: Capacities(maximum: 1),
    ),
    BoxType.CNU672: StackLevel(
      dimensions: StackDimensions(height: 787, width: 794, length: 4600),
      weights: StackWeights(
        net: 523129.0,
        gross: 1020129.0,
        netExplosive: 88900,
        maxNet: 523129.0,
        maxGross: 1020129.0,
        maxNetExplosion: 88900.0,
      ),
      capacities: Capacities(maximum: 1),
    ),
  };
}
