part of widgets;

class CarDetailView extends StatelessWidget {
  CarDetailView();

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)!.settings.arguments as Map;
    Car car = map[Keys.SELECTED_CAR]!;
    int index = map[Keys.CHOSEN_INDEX]!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND,
        appBar: AppBar(
          title: Text('${car.name} ${index + 1}'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.developer_board)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: [
                LengthPropertyTemplate(car.dimensionOfLoadingArea.length),
                WidthPropertyTemplate(car.dimensionOfLoadingArea.width),
                HeightPropertyTemplate(car.dimensionOfLoadingArea.width),
                PermissibleWeightPropertyTemplate(car.weightOfLoadingArea.maximum),
                PermissibleNewPropertyTemplate(car.explosionClass.weightLimit),
                ExplosionClassPropertyTemplate(car.explosionClass.toString()),
                NetExplosiveWeightPropertyTemplate(car.weightOfLoadingArea.currentNetExplosive),
                LoadedWeightPropertyTemplate(car.weightOfLoadingArea.current),
                NumberOfBoxesPropertyTemplate(car.numberOfBoxes),
                NumberOfBaaPropertyTemplate(car.numberOfBaa),
                NumberOfStacksPropertyTemplate(car.stacks.length),
                NumberOfIncompleteBoxesPropertyTemplate(car.numberOfIncompleteBoxes),
              ],
            ),
            StacksListView(car.stacks)
          ],
        ),
      ),
    );
  }
}
