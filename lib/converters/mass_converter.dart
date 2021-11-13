String massConverter(var value) {
  if (value < 1000) return '$value g';

  if (value < 1000000) {
    return '${value / 1000} kg';
  }

  return '${value / 1000000} t';
}