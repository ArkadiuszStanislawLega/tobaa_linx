import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/DetailViews/baa_detail_view.dart';
import 'package:tobaa/widgets/DetailViews/box_detail_view.dart';
import 'package:tobaa/widgets/DetailViews/car_detail_view.dart';
import 'package:tobaa/widgets/DetailViews/stack_detail_view.dart';
import 'package:tobaa/widgets/DetailViews/stack_level_detail_view.dart';
import 'package:tobaa/widgets/DetailViews/transport_detail_view.dart';
import 'package:tobaa/widgets/baa_list.dart';
import 'package:tobaa/widgets/counted_view.dart';
import 'package:tobaa/widgets/settings_view.dart';

import 'box/box.dart';
import 'enumerators/baa_type.dart';


void main() {
  runApp(TOBAAApp());
}

String massConverter(var value){
  if (value < 1000)
    return '$value g';

  if (value < 1000000) {
    return '${value/1000} kg';
  }

  return '${value/1000000} t';
}

String sizeConverter(var value){
  if (value < 100)
    return '$value mm';

  if(value < 1000)
    return '${value/10} cm';

  return '${value/1000} m';
}

class TOBAAApp extends StatelessWidget {


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

  static Transport selectedTransport = Transport();
  static Map<CarType, Transport> transports = {};

  @override
  Widget build(BuildContext context) {
    this._fillSelectedCarList();
    return MaterialApp(
      title: 'Transporting Organiser of Battle Air Assets',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: Url.HOME,
      routes: {
        Url.EMPTY: (context) => BaaList(),
        Url.HOME: (context) => BaaList(),
        Url.DETAIL: (context) => DetailBaa(DatabaseAssets.container[index]!),
        Url.SETTINGS: (context) => SettingsView(),
        Url.COUNTED: (context) => CountedView(),
        Url.CAR_DETAIL: (context) => CarDetailView(selectedCar),
        Url.STACK_DETAIL: (context) => StackDetailView(selectedStack),
        Url.STACK_LEVEL_DETAIL: (context) => StackLevelDetailView(selectedStackLevel),
        Url.BOX_DETAIL: (context) => BoxDetailView(selectedBox),
        Url.TRANSPORT_DETAIL: (context) => TransportDetailView(selectedTransport),
      },
    );
  }

  void _fillSelectedCarList(){
    DatabaseCars.container.forEach((key, value) {
      selectedCars[key] = true;
    });
  }
}






