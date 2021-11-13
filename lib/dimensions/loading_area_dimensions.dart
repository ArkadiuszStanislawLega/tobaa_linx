import 'dimensions.dart';

class LoadingAreaDimensions extends Dimensions {
  late Dimensions _occupied;

  LoadingAreaDimensions({int height = 0, int width = 0, int length = 0})
      : super(height: height, width: width, length: length) {
    this._occupied = new Dimensions();
  }

  Dimensions get occupied => _occupied;

  bool isWillBeFit(Dimensions dimensions) {
    var increasedCapacity = this._occupied.surfaceArea + dimensions.surfaceArea;
    return increasedCapacity <= this.surfaceArea ?  true :  false;
  }

  void append(Dimensions dimensions) {
    if (this.isWillBeFit(dimensions)) {
      this._occupied.length = dimensions.length;
      this._occupied.height = dimensions.height;
      this._occupied.width += dimensions.width;
    }
  }
}
