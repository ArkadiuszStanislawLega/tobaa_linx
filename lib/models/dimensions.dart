part of models;

class Dimensions {
  static const int MINIMUM_SIZE = 0;
  late int _height;
  late int _width;
  late int _length;

  Dimensions({
    height = MINIMUM_SIZE,
    width = MINIMUM_SIZE,
    length= MINIMUM_SIZE
  }){
    this._height = MINIMUM_SIZE;
    this._width = MINIMUM_SIZE;
    this._length = MINIMUM_SIZE;

    this.height = height;
    this.width = width;
    this.length = length;
  }

  int get height => this._height;
  int get width => this._width;
  int get length => this._length;

  set height(int value) {
    if (this._isValueMeetsMinimumRequirements(value))
      this._height = value;
  }

  set width(int value) {
    if (this._isValueMeetsMinimumRequirements(value))
      this._width = value;
  }

  set length(int value) {
    if (this._isValueMeetsMinimumRequirements(value))
      this._length = value;
  }

  bool _isValueMeetsMinimumRequirements(int value) {
    return value >= MINIMUM_SIZE;
  }

  int get capacity {
    return this._height * this._width * this._length;
  }

  int get surfaceArea{
    return this._width * this._length;
  }
}