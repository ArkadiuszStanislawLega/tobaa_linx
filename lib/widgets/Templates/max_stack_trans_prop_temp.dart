part of widgets;

class MaxStackTransPropTemp extends StatelessWidget {
  final int transportMaxStackLevel;

  MaxStackTransPropTemp(this.transportMaxStackLevel);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.MAX_STACK_HEIGHT_DURING_TRANSPORT,
      value: '$transportMaxStackLevel',
      background: Colors.grey[500]!,
    );
  }
}
