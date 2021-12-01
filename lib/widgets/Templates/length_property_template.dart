part of widgets;

class LengthPropertyTemplate extends StatelessWidget {
  final int _length;

  LengthPropertyTemplate(this._length);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.LENGTH,
      value: '${sizeConverter(this._length)}',
      background: Colors.grey[300]!,
    );
  }
}
