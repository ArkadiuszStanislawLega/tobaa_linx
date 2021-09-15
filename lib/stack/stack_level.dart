import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/dimensions/stack_dimensions.dart';
import 'package:tobaa/weights/stack_weights.dart';

class StackLevel {
  late StackDimensions dimensions;
  late StackWeights weights;
  late Capacities capacities;
  late List<Box> boxes;

  StackLevel({
    required this.dimensions,
    required this.weights,
    required this.capacities,
  }) {
    this.boxes = [];
  }

  List<Box> tryAppendBoxes(List<Box> boxes) {
    List<Box> notFitBoxes = [];
    for (int i = 0; i < boxes.length; i++) {
      if (!this.tryAppendBox(boxes[i])) {
        notFitBoxes.add(boxes[i]);
      }
    }
    return notFitBoxes;
  }

  bool tryAppendBox(Box box) {
    if (this.isBoxWillBeFit(box)) {
      this.capacities.tryIncreaseCurrent(box.capacities.current);
      this.weights.addBoxWeights(box);
      this.dimensions.append(box.dimensions);
      this.boxes.add(box);
      return true;
    }
    return false;
  }

  bool isBoxWillBeFit(Box box) {
    bool isCapacityFit = this.capacities.isValueMeetsTheConditionsToIncrease(
        box.capacities.current);
    bool isWeightFit = this.weights.isBoxMeetsConditionsToBeAdd(box);
    bool isDimensionsFit = this.dimensions.isWillBeFit(box.dimensions);
    return isCapacityFit && isWeightFit && isDimensionsFit;
  }


}