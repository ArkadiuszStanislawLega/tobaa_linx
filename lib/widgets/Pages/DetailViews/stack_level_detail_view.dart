part of widgets;

class StackLevelDetailView extends StatelessWidget {
  StackLevelDetailView();

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)!.settings.arguments as Map;
    var stackLevel = map[Keys.SELECTED_STACK_LEVEL]!;
    int index = map[Keys.CHOSEN_INDEX];

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
            title: Text(
                '${index + 1} Poziom stosu z ${stackLevel.boxes.first.name}')),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: MediaQuery.of(context).size.width > 400 ? 6 : 3,
              children: [

                LengthPropertyTemplate(stackLevel.dimensions.length),
                WidthPropertyTemplate(stackLevel.dimensions.width),
                HeightPropertyTemplate(stackLevel.dimensions.height),
                NetExplosiveWeightPropertyTemplate(stackLevel.weights.netExplosive),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_NET_WEIGHT,
                  propertyName: Strings.NET_WEIGHT,
                  propertyValue: '${massConverter(stackLevel.weights.net)}',
                  background: Colors.grey[400]!,
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_GROSS_WEIGHT,
                  propertyName: Strings.GROSS_WEIGHT,
                  propertyValue: '${massConverter(stackLevel.weights.gross)}',
                  background: Colors.grey[400]!,
                ),
                NumberOfBoxesPropertyTemplate(stackLevel.boxes.length),
                NumberOfBaaPropertyTemplate(stackLevel.capacities.current)
              ],
            ),
            BoxesListView(stackLevel.boxes),
          ],
        ),
      ),
    );
  }
}
