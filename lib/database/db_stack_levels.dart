import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/weights/stack_weights.dart';

class DatabaseStackLevels {
  static Map<BoxType, StackLevel> container = {
    BoxType.test: StackLevel(
      dimensions: StackDimensions(
          height: 2,
          width: 33,
          length: 7
      ),
      weights: StackWeights(
          maxNet: 3,
          maxGross: 33,
          maxNetExplosion: 15
      ),
      capacities: Capacities(
          maximum: 30
      ),
    ),
    BoxType.oversizeTest: StackLevel(
      dimensions: StackDimensions(
          height: 7,
          width: 7,
          length: 7
      ),
      weights: StackWeights(
          maxNet: 3,
          maxGross: 6,
          maxNetExplosion: 1.5
      ),
      capacities: Capacities(
          maximum: 30
      ),
    ),
    BoxType.correctSizeTest: StackLevel(
      dimensions: StackDimensions(
          height: 1,
          width: 1,
          length: 5
      ),
      weights: StackWeights(
          maxNet: 3,
          maxGross: 6,
          maxNetExplosion: 1.5
      ),
      capacities: Capacities(
          maximum: 30
      ),
    ),
    BoxType.heavyTest: StackLevel(
      dimensions: StackDimensions(
          height: 1,
          width: 1,
          length: 5
      ),
      weights: StackWeights(
          maxNet: 3,
          maxGross: 450000,
          maxNetExplosion: 1.5
      ),
      capacities: Capacities(
          maximum: 30
      ),
    ),
    BoxType.CNU431: StackLevel(
      dimensions: StackDimensions(
          height: 480,
          width: 4572,
          length: 43943
      ),
      weights: StackWeights(
        net: 306100.0,
        maxNet: 306100.0,
        maxGross: 587100.0,
        maxNetExplosion: 6550.0,
      ),
      capacities: Capacities(
          maximum: 1
      ),
    ),
  };
}