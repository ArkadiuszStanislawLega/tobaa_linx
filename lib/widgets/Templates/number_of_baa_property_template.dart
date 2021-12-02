part of widgets;

class NumberOfBaaPropertyTemplate extends StatelessWidget {
  final int numberOfBaa;

  NumberOfBaaPropertyTemplate(this.numberOfBaa);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NUMBER_OF_THE_BAA,
      value: '$numberOfBaa',
      background: Colors.grey[600]!,
    );
  }
}
