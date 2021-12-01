part of widgets;

class NetExplosiveWeightPropertyTemplate extends StatelessWidget {
  final double _netExplosiveWeight;

  NetExplosiveWeightPropertyTemplate(this._netExplosiveWeight);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NEW,
      value: '${massConverter(this._netExplosiveWeight)}',
      background: Colors.grey[400]!,
    );
  }
}
