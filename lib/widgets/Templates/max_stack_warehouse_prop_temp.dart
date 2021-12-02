part of widgets;

class MaxStackWarehousePropTemp extends StatelessWidget {
  final int maxWarehouseStackLevel;

  MaxStackWarehousePropTemp(this.maxWarehouseStackLevel);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.MAX_WAREHOUSE_STACK_LEVEL,
      value: '$maxWarehouseStackLevel szt.',
      background: Colors.grey[500]!,
    );
  }
}
