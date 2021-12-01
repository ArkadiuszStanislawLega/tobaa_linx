part of widgets;

class WidthPropertyTemplate extends StatelessWidget {
  final int _width;
  final Color backgroundColor;

  WidthPropertyTemplate(this._width, {this.backgroundColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.WIDTH,
      value: '${sizeConverter(this._width)}',
      background: Colors.grey[300]!,
    );
  }
}
