part of models;

class LoadingAreaWeights {
  late double _current;
  late double _maximum;
  late double _currentNetExplosive;
  late double _maximumNetExplosive;

  /// The argument [maximumNetExplosive] must be less or equal to the [maximum].
  /// Otherwise all maximum values will be set 0.
  LoadingAreaWeights({
    double maximum = 0.0,
    double maximumNetExplosive = 0.0
  }){
    this._maximum = 0.0;
    this._maximumNetExplosive = 0.0;

    this.maximum = maximum;
    this.maximumNetExplosive = maximumNetExplosive;

    this._currentNetExplosive = 0.0;
    this._current = 0.0;
  }

  set maximum(double value) {
    if (this._isValueHigherThenZero(value))
      this._maximum = value;
  }

  set maximumNetExplosive(double value) {
    if (this._isValueHigherThenZero(value) &&
        this._isLowerOrEqualToMaximum(value))
      this._maximumNetExplosive = value;
  }

  bool _isValueHigherThenZero(double value) {
    return value > 0;
  }

  bool _isLowerOrEqualToMaximum(double value) {
    return value <= this._maximum;
  }

  double get maximumNetExplosive => _maximumNetExplosive;
  double get currentNetExplosive => _currentNetExplosive;
  double get maximum => _maximum;
  double get current => _current;

  bool tryIncreaseCurrentWeight(double value) {
    if (this._isValueHigherThenZero(value)) {
      var currentWeightIncreased = value + this._current;

      if (this._isLowerOrEqualToMaximum(currentWeightIncreased)) {
        this._current += value;
        return true;
      }
    }
    return false;
  }

  bool tryIncreaseCurrentNetExplosiveWeight(double value) {
    if (this._isValueHigherThenZero(value)) {
      var currentNetExplosiveIncreased = this._currentNetExplosive + value;

      if (this._isLoweOrEqualToNetExplosiveMaximum(
          currentNetExplosiveIncreased)) {
        this._currentNetExplosive += value;
        return true;
      }
    }
    return false;
  }

  bool _isLoweOrEqualToNetExplosiveMaximum(double value) {
    return value <= this._maximumNetExplosive;
  }


}