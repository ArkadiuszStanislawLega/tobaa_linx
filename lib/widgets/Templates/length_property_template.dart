part of widgets;

class LengthPropertyTemplate extends StatelessWidget {
  final int _length;
  final Color backgroundColor;

  LengthPropertyTemplate(this._length,
      {this.backgroundColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.LENGTH,
      value: '${sizeConverter(this._length)}',
      background: this.backgroundColor,
    );
  }
}
