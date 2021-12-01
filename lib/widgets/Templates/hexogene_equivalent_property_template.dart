part of widgets;

class HexogeneEquivalentPropertyTemplate extends StatelessWidget {
  final double _hexogeneEquivalent;

  HexogeneEquivalentPropertyTemplate(this._hexogeneEquivalent);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.HEXOGEN_EQUIVALENT,
      value: '${massConverter(this._hexogeneEquivalent)}',
      background: Colors.grey[500]!,
    );
  }
}
