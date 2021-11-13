String sizeConverter(var value) {
  if (value < 100) return '$value mm';

  if (value < 1000) return '${value / 10} cm';

  return '${value / 1000} m';
}
