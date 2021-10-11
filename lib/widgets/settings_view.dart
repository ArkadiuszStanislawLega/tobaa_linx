import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/main.dart';
import 'package:tobaa/widgets/settings_car_list_item.dart';

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
        title: Text('${TOBAAApp.SETTINGS_TITLE}'),
      ),
      body: Column(
        children: [
          Row(children: [
            Text('${TOBAAApp.WAR_TIME_TITLE}'),
            Switch(value: TOBAAApp.isWar, onChanged: (bool value) =>
            {
              setState(() {
                TOBAAApp.isWar = value;
              })
            },),
          ]
          ),
          listItem
        ],

      ),
    );
  }
}

