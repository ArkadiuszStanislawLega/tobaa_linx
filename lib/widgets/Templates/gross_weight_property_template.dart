part of widgets;

class GrossWeightPropertyTemplate extends StatelessWidget {
  final double _grossWeight;

  GrossWeightPropertyTemplate(this._grossWeight);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.GROSS_WEIGHT,
      value: '${massConverter(this._grossWeight)}',
      background: Colors.grey[400]!,
    );
  }
}
