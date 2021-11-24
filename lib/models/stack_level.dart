part of models;

class StackLevel {
  late StackDimensions dimensions;

  ///maxGross - all assets + all boxes weights,
  ///maxNet - all assets weights.
  late StackWeights weights;
  late Capacities capacities;
  late List<Box> boxes;

  StackLevel.empty() {
    this.dimensions = StackDimensions();
    this.weights = StackWeights();
    this.capacities = Capacities();
    this.boxes = [];
  }

  StackLevel({
    required this.dimensions,
    required this.weights,
    required this.capacities,
  }) {
    this.boxes = [];
  }

  void appendBox(Box box) {
    this.capacities.tryIncreaseCurrent(box.capacities.current);
    this.weights.addBoxWeights(box);
    this.dimensions.append(box.dimensions);
    this.boxes.add(box);
  }

  bool isBoxWillBeFit(Box box) {
    bool isCapacityFit = this
        .capacities
        .isValueMeetsTheConditionsToIncrease(box.capacities.current);
    bool isWeightFit = this.weights.isBoxMeetsConditionsToBeAdd(box);
    bool isDimensionsFit = this.dimensions.isWillBeFit(box.dimensions);
    return isCapacityFit && isWeightFit && isDimensionsFit;
  }
}
