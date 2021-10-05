import 'package:flutter/material.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/widgets/baa_list.dart';
import 'package:tobaa/widgets/counted_view.dart';
import 'package:tobaa/widgets/detail_baa_view.dart';
import 'package:tobaa/widgets/settings_view.dart';
import 'enumerators/baa_type.dart';


void main() {
  runApp(TOBAAApp());
}

class TOBAAApp extends StatelessWidget {
  static const String URL_EMPTY = '/';
  static const String URL_HOME = '/home';
  static const String URL_DETAIL = '/detail';
  static const String URL_SETTINGS = '/settings';
  static const String URL_COUNTED = '/counted';

  static BattleAirAssetType index = BattleAirAssetType.None;
  static bool isWar = false;
  static int value = 0;
  static BattleAirAssetType baa = BattleAirAssetType.None;

  static Map<BattleAirAssetType, int> values = {};
  static Map<CarType, bool> selectedCars = {};

  @override
  Widget build(BuildContext context) {
    DatabaseCars.container.forEach((key, value) {
      selectedCars[key] = true;
    });
    return MaterialApp(
      title: 'Transporting Organiser of Battle Air Assets',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: URL_HOME,
      routes: {
        URL_EMPTY: (context) => BaaList(),
        URL_HOME: (context) => BaaList(),
        URL_DETAIL: (context) => DetailBaa(DatabaseAssets.container[index]!),
        URL_SETTINGS: (context) => SettingsView(),
        URL_COUNTED: (context) => CountedView()
      },
    );
  }
}






