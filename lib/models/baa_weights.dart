part of models;


class BaaWeights extends Weights{

  /// [net] and [gross] must have value bigger then 0,
  /// and gross must have equal to net or higher.
  BaaWeights({
    double gross = 0.0,
    double net = 0.0,
    double netExplosive = 0.0
  })
      : super(gross: gross, net: net, netExplosive: netExplosive);


  /// Value must be higher then 0 and higher then net value.
  set gross(double value) {
    if(this._isValueMeetsTheGrossConditions(value))
      super.gross = value;
  }

  bool _isValueMeetsTheGrossConditions(double value){
    return this.isValueHigherThenZero(value) &&
        this.isValueHigherOrEqualToNetProperty(value);
  }

  bool isValueHigherThenZero(double value){
    return value > 0;
  }

  bool isValueHigherOrEqualToNetProperty(double value){
    return value >= super.net;
  }

  /// Value must be higher then 0.
  set net(double value) {
    if (this.isValueHigherThenZero(value) && value <= this.gross)
      super.net = value;
  }

  set netExplosive(double value) {
    if (this.isValueHigherThenZero(value) &&
        this.isValueLowerOrEqualThenNetProperty(value))
      super.netExplosive = value;
  }

  bool isValueLowerOrEqualThenNetProperty(double value) {
    return value <= super.net;
  }

}
