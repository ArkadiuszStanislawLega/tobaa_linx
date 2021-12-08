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
        crossAxisCount: MediaQuery.of(context).size.width > 450 ? 6 : 3,
        children: [
          LengthPropertyTemplate(box.dimensions.length),
          WidthPropertyTemplate(box.dimensions.width),
          HeightPropertyTemplate(box.dimensions.height),
          GrossWeightPropertyTemplate(box.weights.currentGross),
          NetWeightPropertyTemplate(box.weights.net),
          NetExplosiveWeightPropertyTemplate(box.weights.currentNetExplosive),
          CapacityPropertyTemplate(box.capacities.current),
          MaxStackTransPropTemp(box.maxTransportStackLevel),
          MaxStackWarehousePropTemp(box.maxWarehouseStackLevel),
          NumberOfBaaPropertyTemplate(box.capacities.current)
        ],
      ),
    );
  }
}
