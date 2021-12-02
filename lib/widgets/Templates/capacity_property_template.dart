part of widgets;

class CapacityPropertyTemplate extends StatelessWidget {
  final int capacity;

  CapacityPropertyTemplate(this.capacity);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.CAPACITY,
      value: '$capacity',
      background: Colors.grey[500]!,
    );
  }
}
