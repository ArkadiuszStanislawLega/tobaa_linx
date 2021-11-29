part of models;

class LoadingAreaDimensions extends Dimensions {
  int _rowCounter = 0;
  List<Dimensions> _occupiedDimensions = [];

  LoadingAreaDimensions({int height = 0, int width = 0, int length = 0})
      : super(height: height, width: width, length: length);

  int get occupiedCapacity {
    var occupiedCapacity = 0;
    this._occupiedDimensions.forEach((dimensions) {
      occupiedCapacity += dimensions.capacity;
    });

    return occupiedCapacity;
  }

  bool _isCapacityFit(int capacity) {
    return this.capacity >= this.occupiedCapacity + capacity;
  }

  bool isWillBeFit(Dimensions dimensions) {
    var isCapacityFit = this._isCapacityFit(dimensions.capacity);
    if (this._occupiedDimensions.isNotEmpty && isCapacityFit)
      return this._isValidated(dimensions);
    return isCapacityFit;
  }

  bool isOccupied(List<Coordinates> coordinates) {
    bool v1 = false, v2 = false, v3 = false, v4 = false;
    for (int i = 0; i < this._occupiedDimensions.length; i++) {
      var currentDimensions = this._occupiedDimensions[i];
      v1 = isTheyIntersect(currentDimensions.coordinates[0],
          currentDimensions.coordinates[2], coordinates[0], coordinates[2]);
      v2 = isTheyIntersect(currentDimensions.coordinates[0],
          currentDimensions.coordinates[1], coordinates[0], coordinates[1]);
      v3 = isTheyIntersect(currentDimensions.coordinates[1],
          currentDimensions.coordinates[3], coordinates[1], coordinates[3]);
      v4 = isTheyIntersect(currentDimensions.coordinates[2],
          currentDimensions.coordinates[3], coordinates[2], coordinates[3]);
      if (v1 || v2 || v3 || v4) return true;
    }
    return false;
  }

  int vectorRatio(Coordinates a, Coordinates b, Coordinates c) {
    int x1 = c.x - a.x, y1 = c.y - a.y, x2 = b.x - a.x, y2 = b.y - a.y;
    return x1 * y2 - x2 * y1;
  }

  bool isPointLayOnVector(
      Coordinates beginningVector, Coordinates endVector, Coordinates point) {
    return min(beginningVector.x, endVector.x) <= point.x &&
        point.x <= max(beginningVector.x, endVector.x) &&
        min(beginningVector.y, endVector.y) <= point.y &&
        point.y <= max(beginningVector.y, endVector.y);
  }

  bool isTheyIntersect(Coordinates beginningVectorA, Coordinates endVectorA,
      Coordinates beginningVectorB, Coordinates endVectorB) {
    int v1 = vectorRatio(beginningVectorB, endVectorB, beginningVectorA),
        v2 = vectorRatio(beginningVectorB, endVectorB, endVectorA),
        v3 = vectorRatio(beginningVectorA, endVectorA, beginningVectorB),
        v4 = vectorRatio(beginningVectorA, endVectorA, endVectorB);

    if ((v1 > 0 && v2 < 0 || v1 < 0 && v2 > 0) &&
        (v3 > 0 && v4 < 0 || v3 < 0 && v4 > 0)) return false;

    if (v1 == 0 &&
        isPointLayOnVector(beginningVectorB, endVectorB, beginningVectorA))
      return true;
    if (v2 == 0 && isPointLayOnVector(beginningVectorB, endVectorB, endVectorA))
      return true;
    if (v3 == 0 &&
        isPointLayOnVector(beginningVectorA, endVectorA, beginningVectorB))
      return true;
    if (v4 == 0 && isPointLayOnVector(beginningVectorA, endVectorA, endVectorB))
      return true;

    return false;
  }

  bool _isSizeValidated(Coordinates topRight, Coordinates bottomRight) {
    return this._isWidthFit(topRight) && this._isLengthFit(bottomRight);
  }

  bool _isWidthFit(Coordinates coordinates) {
    return coordinates.x <= this.width;
  }

  bool _isLengthFit(Coordinates coordinates) {
    return coordinates.y <= this.length;
  }

  List<Coordinates> _coordinatesInNextRow(Dimensions dimensions) {
    var lastElement = this._occupiedDimensions.last;
    return [
      Coordinates(
          x: 1,
          y: lastElement.coordinates[2].y + 1,
          z: lastElement.coordinates[2].z),
      Coordinates(
          x: 1 + dimensions.width,
          y: lastElement.coordinates[2].y + 1,
          z: lastElement.coordinates[2].z),
      Coordinates(
          x: 1,
          y: lastElement.coordinates[2].y + dimensions.length,
          z: lastElement.coordinates[2].z),
      Coordinates(
          x: 1 + dimensions.width,
          y: lastElement.coordinates[2].y + dimensions.length,
          z: lastElement.coordinates[2].z),
    ];
  }

  List<Coordinates> _coordinatesInSameRow(Dimensions dimensions) {
    var lastElement = this._occupiedDimensions.last;
    return [
      Coordinates(
          x: lastElement.coordinates[1].x + 1,
          y: lastElement.coordinates[1].y,
          z: lastElement.coordinates[1].z),
      Coordinates(
          x: lastElement.coordinates[1].x + 1 + dimensions.width,
          y: lastElement.coordinates[1].y,
          z: lastElement.coordinates[1].z),
      Coordinates(
          x: lastElement.coordinates[1].x + 1,
          y: lastElement.coordinates[1].y + dimensions.length,
          z: lastElement.coordinates[1].z),
      Coordinates(
          x: lastElement.coordinates[1].x + 1 + dimensions.width,
          y: lastElement.coordinates[1].y + dimensions.length,
          z: lastElement.coordinates[1].z),
    ];
  }

  void append(Dimensions dimensions) {
    this._prepareDimensionsWhenIsFirst(dimensions);
    this._setSpecCoordinates(dimensions);
    this._occupiedDimensions.add(dimensions);
  }

  void _setSpecCoordinates(Dimensions dimensions) {
    if (this._occupiedDimensions.isNotEmpty) {
      List<Coordinates> coordinateForNewDimensions =
          this._coordinatesInSameRow(dimensions);

      if (this._isSizeValidated(
          coordinateForNewDimensions[1], coordinateForNewDimensions[3])) {
        dimensions.coordinates = coordinateForNewDimensions;
        return;
      }

      coordinateForNewDimensions.clear();
      coordinateForNewDimensions = this._coordinatesInNextRow(dimensions);

      if (this._isSizeValidated(
          coordinateForNewDimensions[1], coordinateForNewDimensions[3])) {
        if (!this.isOccupied(coordinateForNewDimensions)) {
          dimensions.coordinates = coordinateForNewDimensions;
        } else {
          this._addToCoordinatesWidth(coordinateForNewDimensions, dimensions);
        }
      }
    }
  }

  void _addToCoordinatesWidth(
      List<Coordinates> coordinateForNewDimensions, Dimensions dimensions) {

    var indexBeforeLastOne = this._occupiedDimensions.length - 2;
    var dimensionsBeforeTheLastOne = this._occupiedDimensions.length > 2
        ? this._occupiedDimensions[indexBeforeLastOne]
        : this._occupiedDimensions.first;
    coordinateForNewDimensions[0].x += 1 + dimensionsBeforeTheLastOne.width;
    coordinateForNewDimensions[1].x += 1 + dimensionsBeforeTheLastOne.width;
    coordinateForNewDimensions[2].x += 1 + dimensionsBeforeTheLastOne.width;
    coordinateForNewDimensions[3].x += 1 + dimensionsBeforeTheLastOne.width;
    dimensions.coordinates = coordinateForNewDimensions;
  }

  bool _isValidated(Dimensions dimensions) {
    if(this._isFitInTheSameRow(dimensions)) return true;
    return this._isFitIntTheNextRow(dimensions);
  }

  bool _isFitIntTheNextRow(Dimensions dimensions){
    List<Coordinates> coordinateForNewDimensions =
    this._coordinatesInNextRow(dimensions);

    var topRight = coordinateForNewDimensions[1];
    var bottomRight = coordinateForNewDimensions[3];

    if (this._isSizeValidated(topRight, bottomRight))
      return true;

    return false;
  }

  bool _isFitInTheSameRow(Dimensions dimensions){
    List<Coordinates> coordinateForNewDimensions = this._coordinatesInSameRow(dimensions);

    if(this._isDimensionsFitToSpecificLocation(coordinateForNewDimensions))
      return true;

    this._addToCoordinatesWidth(coordinateForNewDimensions, dimensions);
    return this._isDimensionsFitToSpecificLocation(coordinateForNewDimensions);
  }

  bool _isDimensionsFitToSpecificLocation(List<Coordinates> coordinateForNewDimensions){

      var topRight = coordinateForNewDimensions[1];
      var bottomRight = coordinateForNewDimensions[3];

      if (this._isSizeValidated(topRight, bottomRight)) {
        if (!this.isOccupied(coordinateForNewDimensions))
          return true;
      }

    return false;

  }

  void _prepareDimensionsWhenIsFirst(Dimensions dimensions) {
    if (this._occupiedDimensions.isEmpty &&
        this._isCapacityFit(dimensions.capacity)) {
      this._setCoordinates(dimensions, Coordinates(x: 1, y: 1, z: 1));
    }
  }

  void _setCoordinates(Dimensions dimensions, Coordinates coordinates) {
    dimensions.coordinates
        .add(Coordinates(x: coordinates.x, y: coordinates.y, z: coordinates.z));
    dimensions.coordinates.add(Coordinates(
        x: coordinates.x + dimensions.width,
        y: coordinates.y,
        z: coordinates.z));
    dimensions.coordinates.add(Coordinates(
        x: coordinates.x,
        y: coordinates.y + dimensions.length,
        z: coordinates.z));
    dimensions.coordinates.add(Coordinates(
        x: coordinates.x + dimensions.width,
        y: coordinates.y + dimensions.length,
        z: coordinates.z));
  }
}
