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

  bool _isCapacityFit(int capacity){
    return  this.capacity >= this.occupiedCapacity + capacity;
  }

  bool isWillBeFit(Dimensions dimensions) {
    var isCapacityFit = this._isCapacityFit(dimensions.capacity);
    return isCapacityFit;
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
      - sprawdzam czy nie wystaje z pojazdu
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
