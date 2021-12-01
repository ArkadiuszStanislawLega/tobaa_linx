part of widgets;

class NetWeightPropertyTemplate extends StatelessWidget {
  final double _netWeight;

  NetWeightPropertyTemplate(this._netWeight);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NET_WEIGHT,
      value: '${massConverter(this._netWeight)}',
      background: Colors.grey[400]!,
    );
  }
}
