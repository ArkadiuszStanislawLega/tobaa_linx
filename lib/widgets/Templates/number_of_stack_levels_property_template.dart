part of widgets;

class NumberOfStackLevelsPropertyTemplate extends StatelessWidget {
  final int numberOfLevels;

  NumberOfStackLevelsPropertyTemplate(this.numberOfLevels);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NUMBER_OF_STACK_LEVELS,
      value: '$numberOfLevels',
      background: Colors.grey[800]!,
    );
  }
}
