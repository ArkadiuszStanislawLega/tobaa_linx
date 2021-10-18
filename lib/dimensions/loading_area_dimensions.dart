import 'dimensions.dart';

class LoadingAreaDimensions extends Dimensions {
  late Dimensions _occupied;

  LoadingAreaDimensions({int height = 0, int width = 0, int length = 0})
      : super(height: height, width: width, length: length) {
    this._occupied = new Dimensions();
  }

  Dimensions get occupied => _occupied;

  bool isWillBeFit(Dimensions dimensions) {
    var increasedCapacity = this._occupied.capacity + dimensions.capacity;
    if (increasedCapacity <= this.capacity) {
      var isIncreasedWidthWillFit =
          this.occupied.width + dimensions.width <= this.width;
      var isIncreasedLengthWillFit =
          this.occupied.length + dimensions.length <= this.length;

      return isIncreasedWidthWillFit || isIncreasedLengthWillFit;
    }

    return false;
  }

  void append(Dimensions dimensions) {
    if (this.isWillBeFit(dimensions)) {
      this._occupied.length = dimensions.length;
      this._occupied.height = dimensions.height;
      this._occupied.width += dimensions.width;
    }
  }
}
