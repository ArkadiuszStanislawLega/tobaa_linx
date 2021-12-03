part of widgets;

class WeightOfAllBaaPropertyTemplate extends StatelessWidget {
  final double transportWeight;

  WeightOfAllBaaPropertyTemplate(this.transportWeight);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.WEIGHT_OF_ALL_BAA,
      value: '${massConverter(this.transportWeight)}',
      background: Colors.grey[400]!,
    );
  }
}
