part of widgets;

class TransportDetailView extends StatelessWidget {
  TransportDetailView();

  @override
  Widget build(BuildContext context) {
    var map =
        ModalRoute.of(context)!.settings.arguments as Map<String, Transport>;
    Transport transport = map[Keys.SELECTED_TRANSPORT]!;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.developer_board)),
              Tab(icon: Icon(Icons.list)),
            ],
          ),
          title: Text(DatabaseCars.container[transport.selectedCar]!.name),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(10),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: MediaQuery.of(context).size.width > 400 ? 6 : 3,
              children: [
                NetExplosiveWeightPropertyTemplate(transport.transportNetExplosiveWeight),
                LoadedWeightPropertyTemplate(transport.transportGrossWeight),
                WeightOfAllBaaPropertyTemplate(transport.transportNetWeight),
                NumberOfCarsPropertyTemplate(transport.numberOfCars),
                NumberOfStacksPropertyTemplate(transport.numberOfStacks),
                NumberOfBoxesPropertyTemplate(transport.numberOfBoxes),
                NumberOfIncompleteBoxesPropertyTemplate(transport.numberOfIncompleteBoxes),
                NumberOfBaaPropertyTemplate(transport.numberOfBaa),
                IsWarPropertyTemplate(transport.isWarTime)
              ],
            ),
            CarsListView(transport.cars)
          ],
        ),
      ),
    );
  }
}
