part of widgets;

class AssetNameTemplate extends StatelessWidget{
  final String _name;

  AssetNameTemplate(this._name);

  @override
  Widget build(BuildContext context) {
    return     ChipTemplate(
      label: this._name,
      backgroundColor: Colors.blue[600]!,
      fontColor: Colors.white,
    );
  }

}