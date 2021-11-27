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
    var lastElement = this._occupiedDimensions.last;
    var pointExtremeRightAtTheTop =
        this._pointExtremeRightAtTheTop(lastElement);
    var pointFurthestLeft = this._pointFurthestLeft(lastElement);

    pointExtremeRightAtTheTop.x += 1 + dimensions.width;

    if (pointExtremeRightAtTheTop.x <= this.width) {
      pointExtremeRightAtTheTop.y += dimensions.height;
      if (pointExtremeRightAtTheTop.y <= this.length)
        return true;
      else {
        pointFurthestLeft.y += 1;
        pointFurthestLeft.x += dimensions.width;
        if (pointFurthestLeft.x <= this.width) {
          pointFurthestLeft.y += dimensions.length;
          if (pointFurthestLeft.y <= this.length) return true;
        }
      }
    }
    return false;
  }

  Coordinates _pointFurthestLeft(Dimensions dimensions) {
    Coordinates answer = Coordinates();
    dimensions.coordinates.forEach((current) {
      var isXLess = answer.x < 0 || current.x < answer.x;
      var isYGrater = current.y > answer.y;
      if (isXLess && isYGrater) answer = current;
    });
    return answer;
  }

  Coordinates _pointExtremeRightAtTheTop(Dimensions dimensions) {
    Coordinates answer = Coordinates();
    dimensions.coordinates.forEach((current) {
      var isXGreater = current.x > answer.x;
      var isYLess = answer.y < 0 || current.y < answer.y;
      if (isXGreater && isYLess) answer = current;
    });
    return answer;
  }

  void append(Dimensions dimensions) {
    this._prepareDimensionsWhenIsFirst(dimensions);

    this._occupiedDimensions.add(dimensions);
    //
    // if (this.isWillBeFit(dimensions)) {
    //   this._occupied.length = dimensions.length;
    //   this._occupied.height = dimensions.height;
    //   this._occupied.width += dimensions.width;
    // }
  }

  void _prepareDimensionsWhenIsFirst(Dimensions dimensions) {
    if (this._occupiedDimensions.isEmpty &&
        this._isCapacityFit(dimensions.capacity)) {
      this._setCoordinates(dimensions, Coordinates(x: 0, y:0, z:0));
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

/*
  stary obszar x1
  nowy obszar x2
  1. biorę ostatni element z listy zajetych obszarów
  2. biorę skrajny punkt z najwikszym x i najmniejszym y
  3. powiekszam w osi x o 1 i dodaje szerokość nowego obszaru do osi x
  4. sprawdzam czy wystaje po za pojazd
    a. tak - jeżeli wystaje:
      - biorę ostatniego elentu dolny skrajne po lewej rog
      - powiekszam o jeden w osi y i w osi x o szerokosc
      - sprawdzam czy element wystaje za pojazd w osi y
        @ tak:
          - objekt sie nie miesci
        @ nie:
          - sprawdzam czy miesci sie w osi x
            # tak:
              - objekt sie miesci
            # nie:
              - objekt sie nie miesc

    b. nie - nie wystaje:
      - dodaje do nowego obszaru dlugosc obszaru, powiekszam os y
      - sprawdzam czy wystaje z pojazdu
        - tak:
          - biore ostatni element z listy i jego punkty o najmniejszym x i najwiekszym y
          - powiekszam w osi y o dlugosc i sprawdzam czy sie miesci
            - tak:
              - sprawdzam czy miesci sie na szeroksc
                - tak:
                  - miesci sie
                - nie:
                  - nie miesci sie
             - nie:
              - nie miesci sie
        - nie:
          - miesci sie
   */
}
