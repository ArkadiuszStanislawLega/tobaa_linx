part of widgets;

class PermissibleNewPropertyTemplate extends StatelessWidget {
  final double netExplosionWeightLimit;

  PermissibleNewPropertyTemplate(this.netExplosionWeightLimit);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.PERMISSIBLE_NEW,
      value: '${massConverter(this.netExplosionWeightLimit)}',
      background: Colors.grey[400]!,
    );
  }
}
