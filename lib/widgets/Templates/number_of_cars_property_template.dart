part of widgets;

class NumberOfCarsPropertyTemplate extends StatelessWidget {
  final int numberOfCars;

  NumberOfCarsPropertyTemplate(this.numberOfCars);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.NUMBER_OF_CARS,
      value: '$numberOfCars',
      background: Colors.grey[600]!,
    );
  }
}
