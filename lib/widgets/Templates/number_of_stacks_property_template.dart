part of widgets;

class NumberOfStacksPropertyTemplate extends StatelessWidget {
  final int numberOfStacks;

  NumberOfStacksPropertyTemplate(this.numberOfStacks);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NUMBER_OF_THE_STACKS,
      value: '$numberOfStacks',
      background: Colors.grey[300]!,
    );
  }
}
