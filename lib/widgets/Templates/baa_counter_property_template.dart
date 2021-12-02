part of widgets;

class BaaCounterPropertyTemplate extends StatelessWidget {
  final int numberOfBaa;

  BaaCounterPropertyTemplate(this.numberOfBaa);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NUMBER_OF_CHOSEN_BAA,
      value: '$numberOfBaa szt.',
      background: Colors.grey[600]!,
    );
  }
}
