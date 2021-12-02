part of widgets;

class NumberOfIncompleteBoxesPropertyTemplate extends StatelessWidget {
  final int numberOfIncompleteBoxes;

  NumberOfIncompleteBoxesPropertyTemplate(this.numberOfIncompleteBoxes);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NUMBER_OF_INCOMPLETE_BOXES,
      value: '$numberOfIncompleteBoxes',
      background: Colors.grey[600]!,
    );
  }
}
