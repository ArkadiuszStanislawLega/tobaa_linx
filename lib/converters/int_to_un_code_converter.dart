part of converters;

String inToUnCodeConverter(int value) {
  if (value < 10) return '000$value';
  if (value < 100) return '00$value';
  if (value < 1000) return '0$value';
  return '$value';
}