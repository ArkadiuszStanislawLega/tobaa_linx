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
    //Drugi element listy to element skrajny prawy od góry
    //Trzeci elementy listy to elementy skrajny prawt dolny dla nowego koordynatów wymiaru
    if (this._isSizeValidated(coordinateForNewDimensions[1], coordinateForNewDimensions[3])) return true;

    coordinateForNewDimensions.clear();
    coordinateForNewDimensions = this._coordinatesInNewRow(dimensions);

    if (this._isSizeValidated(coordinateForNewDimensions[1], coordinateForNewDimensions[3])) return true;

    return false;
  }

  bool _isSizeValidated(Coordinates topRight, Coordinates bottomRight){
    return this._isWidthFit(topRight) && this._isLengthFit(bottomRight);
  }

  bool _isWidthFit(Coordinates coordinates){
    return coordinates.x <= this.width;
  }

  bool _isLengthFit(Coordinates coordinates){
    return coordinates.y <= this.length;
  }

  List<Coordinates> _coordinatesInNewRow(Dimensions dimensions){
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
    //
    // if (this.isWillBeFit(dimensions)) {
    //   this._occupied.length = dimensions.length;
    //   this._occupied.height = dimensions.height;
    //   this._occupied.width += dimensions.width;
    // }
  }

  void _setSpecCoordinates(Dimensions dimensions){
    if(this._occupiedDimensions.isNotEmpty) {
      List<Coordinates> coordinateForNewDimensions =
      this._coordinatesInSameRow(dimensions);

      if (this._isSizeValidated(coordinateForNewDimensions[1], coordinateForNewDimensions[3])) {
        dimensions.coordinates = coordinateForNewDimensions;
        return;
      }

      coordinateForNewDimensions.clear();
      coordinateForNewDimensions = this._coordinatesInNewRow(dimensions);

      if (this._isSizeValidated(coordinateForNewDimensions[1], coordinateForNewDimensions[3]))
        dimensions.coordinates = coordinateForNewDimensions;
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
