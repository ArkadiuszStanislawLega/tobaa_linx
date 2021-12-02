part of widgets;

class ExplosionClassPropertyTemplate extends StatelessWidget {
  final String explosionClass;

  ExplosionClassPropertyTemplate(this.explosionClass);

  @override
  Widget build(BuildContext context) {
    return PropertyGameTemplate(
      name: Strings.EXPLOSION_CLASS,
      value: this.explosionClass,
      background: Colors.grey[200]!,
    );
  }
}
