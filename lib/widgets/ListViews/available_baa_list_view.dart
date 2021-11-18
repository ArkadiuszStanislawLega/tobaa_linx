part of widgets;

class AvailableBaaListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AvailableBaaListViewState();
  }
}

class _AvailableBaaListViewState extends State<AvailableBaaListView> {
  _AvailableBaaListViewState();

  @override
  Widget build(BuildContext context) {
    Iterable<BattleAirAsset> assets = DatabaseAssets.container.values;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: assets.length,
      itemBuilder: (context, index) {
        return ListTile(
            onTap: () {
              TOBAAApp.index = assets.elementAt(index).type;
              Navigator.pushNamed(context, Url.DETAIL);
            },
            title: BaaListItem(assets.elementAt(index)));
      },
    );
  }
}
