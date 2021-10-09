import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/baa_list.dart';
import 'package:tobaa/widgets/car_detail_view.dart';
import 'package:tobaa/widgets/counted_view.dart';
import 'package:tobaa/widgets/detail_baa_view.dart';
import 'package:tobaa/widgets/settings_view.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/stack_detail_view.dart';
import 'package:tobaa/widgets/stack_level_detail_view.dart';
import 'box/box.dart';
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
  static const String URL_CAR_DETAIL = '/car_detail';
  static const String URL_STACK_DETAIL = '/stack_detail';
  static const String URL_STACK_LEVEL_DETAIL = '/stack_level_detail';
  static const String URL_BOX_DETAIL = '/box_detail';

  static BattleAirAssetType index = BattleAirAssetType.None;
  static Car selectedCar = Car.empty();
  static ContainerStack.Stack selectedStack = ContainerStack.Stack.empty();
  static StackLevel selectedStackLevel = StackLevel.empty();
  static Box selectedBox = Box.empty();
  static bool isWar = false;
  static int value = 0;
  static BattleAirAssetType baa = BattleAirAssetType.None;

  static Map<BattleAirAssetType, int> values = {};
  static Map<CarType, bool> selectedCars = {};

  static Transport transport = Transport();

  @override
  Widget build(BuildContext context) {
    this._fillSelectedCarList();
    return MaterialApp(
      title: 'Transporting Organiser of Battle Air Assets',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: URL_HOME,
      routes: {
        URL_EMPTY: (context) => BaaList(),
        URL_HOME: (context) => BaaList(),
        URL_DETAIL: (context) => DetailBaa(DatabaseAssets.container[index]!),
        URL_SETTINGS: (context) => SettingsView(),
        URL_COUNTED: (context) => CountedView(),
        URL_CAR_DETAIL: (context) => CarDetailView(selectedCar),
        URL_STACK_DETAIL: (context) => StackDetailView(selectedStack),
        URL_STACK_LEVEL_DETAIL: (context) => StackLevelDetailView(selectedStackLevel),
      },
    );
  }

  void _fillSelectedCarList(){
    DatabaseCars.container.forEach((key, value) {
      selectedCars[key] = true;
    });
  }
}






