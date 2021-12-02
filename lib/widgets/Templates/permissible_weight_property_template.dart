part of widgets;

class PermissibleWeightPropertyTemplate extends StatelessWidget {
  final double weightLimit;

  PermissibleWeightPropertyTemplate(this.weightLimit);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.PERMISSIBLE_WEIGHT,
      value: '${massConverter(this.weightLimit)}',
      background: Colors.grey[400]!,
    );
  }
}
