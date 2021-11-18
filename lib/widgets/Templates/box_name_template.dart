part of widgets;

class BoxNameTemplate extends StatelessWidget {
  final BoxType _boxType;

  BoxNameTemplate(this._boxType);

  @override
  Widget build(BuildContext context) {
    return ChipTemplate(
      label: '${DatabaseBoxes.container[this._boxType]!.name}',
      backgroundColor: Colors.amberAccent,
      fontColor: Colors.black,
    );
  }
}
