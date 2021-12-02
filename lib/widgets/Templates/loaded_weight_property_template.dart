part of widgets;

class LoadedWeightPropertyTemplate extends StatelessWidget {
  final double loadedWeight;

  LoadedWeightPropertyTemplate(this.loadedWeight);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.LOAD_WEIGHT,
      value: '${massConverter(this.loadedWeight)}',
      background: Colors.grey[400]!,
    );
  }
}
