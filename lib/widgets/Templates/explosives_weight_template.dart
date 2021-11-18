part of widgets;

class ExplosivesWeightTemplate extends StatelessWidget {
  final double _weight;

  ExplosivesWeightTemplate(this._weight);

  @override
  Widget build(BuildContext context) {
    return ChipIconTemplate(
        label: '${massConverter(this._weight)}',
        icon: Icons.flare,
        backgroundColor: Colors.blueGrey,
        fontColor: Colors.white);
  }
}
