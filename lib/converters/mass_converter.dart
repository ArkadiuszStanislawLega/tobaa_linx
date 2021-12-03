part of converters;



double roundDouble(double value, int places){
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}

String massConverter(var value) {
  if (value < 1000) return '${roundDouble(value,3)} g';

  if (value < 1000000) {
    return '${roundDouble(value / 1000,3)} kg';
  }

  return '${roundDouble(value / 1000000,3)} t';
}