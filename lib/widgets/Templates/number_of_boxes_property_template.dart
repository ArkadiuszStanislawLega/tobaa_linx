part of widgets;

class NumberOfBoxesPropertyTemplate extends StatelessWidget {
  final int numberOfBoxes;

  NumberOfBoxesPropertyTemplate(this.numberOfBoxes);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NUMBER_OF_THE_CONTAINERS,
      value: '$numberOfBoxes',
      background: Colors.grey[600]!,
    );
  }
}
