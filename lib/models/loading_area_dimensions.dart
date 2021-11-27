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

  bool _isValidated(Dimensions dimensions) {
    List<Coordinates> coordinateForNewDimensions =
        this._coordinatesInSameRow(dimensions);

    if (this._isSizeValidated(
        coordinateForNewDimensions[1], coordinateForNewDimensions[3])) {
      if (!this.isOccupied(coordinateForNewDimensions)) {
        return true;
      } else {
        var lastDimens = this._occupiedDimensions.last;
        coordinateForNewDimensions[0].x += lastDimens.width;
        coordinateForNewDimensions[1].x += lastDimens.width;
        coordinateForNewDimensions[2].x += lastDimens.width;
        coordinateForNewDimensions[3].x += lastDimens.width;
        return true;
      }
    }

    coordinateForNewDimensions.clear();
    coordinateForNewDimensions = this._coordinatesInNewRow(dimensions);

    if (this._isSizeValidated(
        coordinateForNewDimensions[1], coordinateForNewDimensions[3]))
      return true;

    return false;
  }

  bool isOccupied(List<Coordinates> coordinates) {
    bool v1 = false;
    bool v2 = false;
    bool v3 = false;
    bool v4 = false;
    for (int i = 0; i < this._occupiedDimensions.length; i++) {
      var currentDimensions = this._occupiedDimensions[i];
      v1 = czy_przecinaja(currentDimensions.coordinates[0],
          currentDimensions.coordinates[2], coordinates[0], coordinates[2]);
      v2 = czy_przecinaja(currentDimensions.coordinates[0],
          currentDimensions.coordinates[1], coordinates[0], coordinates[1]);
      v3 = czy_przecinaja(currentDimensions.coordinates[1],
          currentDimensions.coordinates[3], coordinates[1], coordinates[3]);
      v4 = czy_przecinaja(currentDimensions.coordinates[2],
          currentDimensions.coordinates[3], coordinates[2], coordinates[3]);
      if (v1 || v2 || v3 || v4) return true;
    }
    return false;
  }

  int iloczyn_wektorowy(Coordinates X, Coordinates Y, Coordinates Z) {
    int x1 = Z.x - X.x, y1 = Z.y - X.y, x2 = Y.x - X.x, y2 = Y.y - X.y;
    return x1 * y2 - x2 * y1;
  }

//sprawdzenie, czy punkt Z(koniec odcinka pierwszego)
//leży na odcinku XY
  bool sprawdz(Coordinates X, Coordinates Y, Coordinates Z) {
    return min(X.x, Y.x) <= Z.x &&
        Z.x <= max(X.x, Y.x) &&
        min(X.y, Y.y) <= Z.y &&
        Z.y <= max(X.y, Y.y);
  }

  bool czy_przecinaja(
      Coordinates A, Coordinates B, Coordinates C, Coordinates D) {
    int v1 = iloczyn_wektorowy(C, D, A),
        v2 = iloczyn_wektorowy(C, D, B),
        v3 = iloczyn_wektorowy(A, B, C),
        v4 = iloczyn_wektorowy(A, B, D);

    //sprawdzenie czy się przecinają - dla niedużych liczb
    //if(v1*v2 < 0 && v3*v4 < 0) return 1;

    //sprawdzenie czy się przecinają - dla większych liczb
    if ((v1 > 0 && v2 < 0 || v1 < 0 && v2 > 0) &&
        (v3 > 0 && v4 < 0 || v3 < 0 && v4 > 0)) return false;

    //sprawdzenie, czy koniec odcinka leży na drugim
    if (v1 == 0 && sprawdz(C, D, A)) return true;
    if (v2 == 0 && sprawdz(C, D, B)) return true;
    if (v3 == 0 && sprawdz(A, B, C)) return true;
    if (v4 == 0 && sprawdz(A, B, D)) return true;

    //odcinki nie mają punktów wspólnych
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

  List<Coordinates> _coordinatesInNewRow(Dimensions dimensions) {
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
      coordinateForNewDimensions = this._coordinatesInNewRow(dimensions);

      if (this._isSizeValidated(
          coordinateForNewDimensions[1], coordinateForNewDimensions[3])) {

        if (!this.isOccupied(coordinateForNewDimensions)) {
          dimensions.coordinates = coordinateForNewDimensions;
        } else {
          var lastDimens = this._occupiedDimensions.last;
          coordinateForNewDimensions[0].x += 1 + lastDimens.width;
          coordinateForNewDimensions[1].x += 1 + lastDimens.width;
          coordinateForNewDimensions[2].x += 1 + lastDimens.width;
          coordinateForNewDimensions[3].x += 1 + lastDimens.width;
          dimensions.coordinates = coordinateForNewDimensions;
        }
      }
    }
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
