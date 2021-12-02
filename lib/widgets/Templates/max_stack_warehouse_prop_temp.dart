part of widgets;

class MaxStackWarehousePropTemp extends StatelessWidget {
  final int maxWarehouseStackLevel;

  MaxStackWarehousePropTemp(this.maxWarehouseStackLevel);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.MAX_WAREHOUSE_STACK_LEVEL,
      value: '$maxWarehouseStackLevel',
      background: Colors.white30,
    );
  }
}
