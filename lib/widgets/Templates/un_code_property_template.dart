part of widgets;

class UnCodePropertyTemplate extends StatelessWidget {
  final int _unCode;

  UnCodePropertyTemplate(this._unCode);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.UN_CODE,
      value: '${intToUnCodeConverter(this._unCode)}',
      background: Colors.grey[500]!,
    );
  }
}
