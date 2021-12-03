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
              crossAxisCount: 3,
              children: [
                NetExplosiveWeightPropertyTemplate(transport.transportNetExplosiveWeight),
                LoadedWeightPropertyTemplate(transport.transportGrossWeight),
                PropertyGameTemplate(
                  name: Strings.WEIGHT_OF_ALL_BAA,
                  value: '${massConverter(transport.transportNetWeight)}',
                  background: Colors.grey[400]!,
                ),
                NumberOfCarsPropertyTemplate(transport.numberOfCars),
                NumberOfStacksPropertyTemplate(transport.numberOfStacks),
                NumberOfBoxesPropertyTemplate(transport.numberOfBoxes),
                NumberOfIncompleteBoxesPropertyTemplate(transport.numberOfIncompleteBoxes),
                NumberOfBaaPropertyTemplate(transport.numberOfBaa),
                PropertyGameTemplate(
                  name: Strings.WAR_TIME,
                  value: '${transport.isWarTime ? Strings.YES : Strings.NO}',
                  background: Colors.grey[400]!,
                ),
              ],
            ),
            CarsListView(transport.cars)
          ],
        ),
      ),
    );
  }
}
