part of models;

class LoadingAreaDimensions extends Dimensions {
  int _rowCounter = 0;
  List<Dimensions> _occupiedDimensions = [];

  LoadingAreaDimensions({int height = 0, int width = 0, int length = 0})
      : super(height: height, width: width, length: length);

  int get occupiedCapacity {
    var occupiedCapacity = 0;
    this._occupiedDimensions.forEach((dimensions){
      occupiedCapacity += dimensions.capacity;
    });

    return occupiedCapacity;
  }

  bool isWillBeFit(Dimensions dimensions) {
    return this.capacity >= this.occupiedCapacity + dimensions.capacity;
  }

  void append(Dimensions dimensions) {
    this._occupiedDimensions.add(dimensions);
    //
    // if (this.isWillBeFit(dimensions)) {
    //   this._occupied.length = dimensions.length;
    //   this._occupied.height = dimensions.height;
    //   this._occupied.width += dimensions.width;
    // }
  }
}
