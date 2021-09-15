class Capacities{
  late int maximum;
  late int _current;

  Capacities({this.maximum = 1}){
    this._current = 0;
  }

  bool get isFull {
    return this._current > 0 && this._current >= this.maximum;
  }

  int get current => this._current;

  bool tryIncreaseCurrent(int value) {
    if(this.isValueMeetsTheConditionsToIncrease(value)) {
      this._current += value;
      return true;
    }
    return false;
  }
  
  bool isValueMeetsTheConditionsToIncrease(value){
    return this._isHigherThenZero(value) && this._isWouldFit(value);
  }

  bool _isHigherThenZero(int value){
    return value > 0;
  }

  /// Checks if the given capacity [value] can fit.
  bool _isWouldFit(int value){
    var capacityAfterAttachedValue = this._current + value;
    return capacityAfterAttachedValue <= this.maximum;
  }

  void fillToMaximum(){
    this._current = this.maximum;
  }

  void clear(){
    this._current = 0;
  }
}
