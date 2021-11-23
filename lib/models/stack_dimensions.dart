part of models;

class StackDimensions extends Dimensions {
  int _occupiedCapacity = 0;

  StackDimensions({int height = 0, int width = 0, int length = 0})
      : super(height: height, width: width, length: length);

  int get occupied => _occupiedCapacity;

  bool isWillBeFit(Dimensions dimensions) {
    var fitWidth = this.width >= dimensions.width;
    var fitLength = this.length >= dimensions.length;
    var updateCapacity = this._occupiedCapacity+dimensions.capacity;
    var capacityCurrent = this.capacity;
    var fitCapacity = updateCapacity <= capacityCurrent;
    return fitWidth && fitLength && fitCapacity;
  }

  void append(Dimensions dimensions) {
    this._occupiedCapacity += dimensions.capacity;
  }
}
