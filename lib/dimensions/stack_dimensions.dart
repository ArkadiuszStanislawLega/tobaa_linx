import 'package:tobaa/dimensions/dimensions.dart';

class StackDimensions extends Dimensions{
  late Dimensions _occupied;

  StackDimensions({
    int height = 0,
    int width= 0,
    int length= 0
  }) : super(height: height, width: width, length: length){
    this._initial();
  }

  Dimensions get occupied => _occupied;

  void _initial(){
    this._occupied = new Dimensions();
  }

  bool isWillBeFit(Dimensions dimensions) {
    var dimensionAddedToCurrentOccupiedWidth = this._occupied.width +
        dimensions.width;
    var capacityWithAddedDimension = dimensions.length * dimensions.height *
        dimensionAddedToCurrentOccupiedWidth;
    return capacityWithAddedDimension <= this.capacity;
  }

  void append(Dimensions dimensions){
    if (this.isWillBeFit(dimensions)) {
      this._occupied.length = dimensions.length;
      this._occupied.height = dimensions.height;
      this._occupied.width += dimensions.width;
    }
  }

}