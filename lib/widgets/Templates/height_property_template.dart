part of widgets;

class HeightPropertyTemplate extends StatelessWidget {
  final int _height;

  HeightPropertyTemplate(this._height);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.HEIGHT,
      value: '${sizeConverter(this._height)}',
      background: Colors.grey[300]!,
    );
  }
}
