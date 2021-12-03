part of widgets;

class IsWarPropertyTemplate extends StatelessWidget {
  final bool isWar;

  IsWarPropertyTemplate(this.isWar);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.WAR_TIME,
      value: '${this.isWar ? Strings.YES : Strings.NO}',
      background: Colors.orangeAccent,
    );
  }
}
