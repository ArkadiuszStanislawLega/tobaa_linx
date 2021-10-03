import 'package:flutter/material.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/widgets/baa_list.dart';
import 'package:tobaa/widgets/counted_view.dart';
import 'package:tobaa/widgets/detail_baa_view.dart';
import 'package:tobaa/widgets/settings_view.dart';
import 'enumerators/baa_type.dart';


void main() {
  runApp(TOBAAApp());
}

class TOBAAApp extends StatelessWidget {
  static BattleAirAssetType index = BattleAirAssetType.None;

  static int value = 0;
  static BattleAirAssetType baa = BattleAirAssetType.None;
  static Map<BattleAirAssetType, int> values = {};

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transporting Organiser of Battle Air Assets',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/home',
      routes: {
        '/' : (context) => BaaList(),
        '/home': (context) => BaaList(),
        '/detail' : (context) => DetailBaa(DatabaseAssets.container[index]!, this._addValue),
        '/settings' : (context) => SettingsView(),
        '/counted' : (context) => CountedView()
      },
    );
  }


  void _addValue(){
    values[baa] = 100;
    print('${values[baa]}');
    // setState(() {
    //   values[baa] = 100;
    // });
  }
}






