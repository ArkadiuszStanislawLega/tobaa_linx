part of widgets;

class HazardClassTemplate extends StatelessWidget {
  final ExplosionClass _explosionClass;

  HazardClassTemplate(this._explosionClass);

  @override
  Widget build(BuildContext context) {
    return ChipTemplate(
      label: this._explosionClass.toString(),
      backgroundColor: Colors.orangeAccent[700]!,
      fontColor: Colors.white,
    );
  }
}
