part of widgets;

class BoxDetailView extends StatelessWidget {
  BoxDetailView();

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)!.settings.arguments as Map;
    Box box = map[Keys.SELECTED_BOX]!;
    
    return Scaffold(
      backgroundColor: AppColors.BACKGROUND,
      appBar: AppBar(title: Text('${box.name}')),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(5),
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: 3,
        children: [
          PropertyGameTemplate(
            name: Strings.WIDTH,
            value: '${sizeConverter(box.dimensions.width)}',
            background: Colors.grey[100]!,
          ),
          PropertyGameTemplate(
            name: Strings.LENGTH,
            value: '${sizeConverter(box.dimensions.length)}',
            background: Colors.grey[100]!,
          ),
          PropertyGameTemplate(
            name: Strings.HEIGHT,
            value: '${sizeConverter(box.dimensions.height)}',
            background: Colors.grey[100]!,
          ),
          PropertyWithHintTemplate(
            hint: Strings.HINT_NET_WEIGHT,
            propertyName: Strings.NET_WEIGHT,
            propertyValue: '${massConverter(box.weights.net)}',
            background: Colors.grey[200]!,
          ),
          PropertyWithHintTemplate(
            hint: Strings.HINT_GROSS_WEIGHT,
            propertyName: Strings.GROSS_WEIGHT,
            propertyValue: '${massConverter(box.weights.currentGross)}',
            background: Colors.grey[200]!,
          ),
          PropertyGameTemplate(
            name: Strings.NEW,
            value: '${massConverter(box.weights.currentNetExplosive)}',
            background: Colors.grey[200]!,
          ),
          PropertyGameTemplate(
            name: Strings.CAPACITY,
            value: '${box.capacities.maximum} szt.',
            background: Colors.grey[300]!,
          ),
          PropertyGameTemplate(
            name: Strings.NUMBER_OF_THE_BAA,
            value: '${box.capacities.current} szt.',
            background: Colors.grey[300]!,
          ),
          PropertyGameTemplate(
            name: Strings.MAX_STACK_LEVEL,
            value: '${box.maxTransportStackLevel}',
            background: Colors.grey[300]!,
          ),

        ],
      ),
    );
  }
}
