part of widgets;

class StackDetailView extends StatelessWidget {
  StackDetailView();

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context)!.settings.arguments as Map;
    WarehouseStack stack = map[Keys.SELECTED_STACK]!;
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
              '${Strings.STACK} nr: ${index + 1}, ${stack.levels.first.boxes.first.name}'),
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
                LengthPropertyTemplate(stack.dimensions.length),
                WidthPropertyTemplate(stack.dimensions.width),
                HeightPropertyTemplate(stack.dimensions.height),

                PropertyWithHintTemplate(
                  hint: Strings.HINT_NET_WEIGHT,
                  propertyName: Strings.NET_WEIGHT,
                  propertyValue: '${massConverter(stack.weights.net)}',
                  background: Colors.grey[400]!,
                ),
                PropertyWithHintTemplate(
                  hint: Strings.HINT_GROSS_WEIGHT,
                  propertyName: Strings.GROSS_WEIGHT,
                  propertyValue: '${massConverter(stack.weights.gross)}',
                  background: Colors.grey[400]!,
                ),

                NetExplosiveWeightPropertyTemplate(stack.weights.netExplosive),
                MaxStackTransPropTemp(stack.maximumStackLevel),
                NumberOfStackLevelsPropertyTemplate(stack.levels.length),
                NumberOfBoxesPropertyTemplate(stack.currentNumberOfBoxes),
                NumberOfBaaPropertyTemplate(
                    stack.battleAirAssetCapacities.current),


              ],
            ),
            StackLevelsListView(stack.levels),
          ],
        ),
      ),
    );
  }
}
