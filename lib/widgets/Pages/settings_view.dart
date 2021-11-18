part of widgets;

class SettingsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingView();
  }
}

class _SettingView extends State<SettingsView> {

  @override
  Widget build(BuildContext context) {
    Iterable<Car> assets = DatabaseCars.container.values;
    var listItem = new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: assets.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
              onTap: (){
                // TOBAAApp.selectedCars.add(assets.elementAt(index));
                // Navigator.pushNamed(context, TOBAAApp.URL_DETAIL);
              },
              title: SettingsCarListItem(assets.elementAt(index))
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${Strings.SETTINGS}'),
      ),
      body: listItem
    );
  }
}

