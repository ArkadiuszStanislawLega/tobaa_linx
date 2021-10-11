import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/database/db_cars.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/transport/transport.dart';
import 'package:tobaa/widgets/box_detail_view.dart';
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

String massConverter(var number){
  var num = number / 1000000;
  return '${num}t';
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

  static const String NEW_TITLE = 'Waga ładunków wybuchowych:';
  static const String NET_WEIGHT_TITLE = 'Waga netto:';
  static const String GROSS_WEIGHT_TITLE = 'Waga brutto:';
  static const String LOAD_WEIGHT_TITLE = 'Waga ładunku:';
  static const String PERMISSIBLE_WEIGHT_TITLE = 'Dopuszczalna waga:';
  static const String PERMISSIBLE_NEW_TITLE = 'Dopuszczalna waga ładunku wybuchowego:';
  static const String EXPLOSION_CLASS_TITLE = 'Klasa wybuchowości:';
  static const String NUMBER_OF_THE_CONTAINERS_TITLE = 'Ilość kontenerów:';
  static const String NUMBER_OF_THE_BAA_TITLE = 'Ilość środków:';
  static const String NUMBER_OF_THE_STACKS_TITLE = 'Ilość stosów:';
  static const String LENGTH_TITLE = 'Długość:';
  static const String WIDTH_TITLE = 'Szerokość:';
  static const String HEIGHT_TITLE = 'Wysokość:';
  static const String LOADING_AREA_TITLE = 'Powierzchnia załadunkowa:';
  static const String CAR_NAME_TITLE = 'Nazwa pojazdu:';
  static const String NAME_TITLE = 'Nazwa:';
  static const String SETTINGS_TITLE = 'Ustawienia';
  static const String WAR_TIME_TITLE = 'Czas wojny';
  static const String MAX_STACK_LEVEL_TITLE = 'Maksymalny poziom stosu:';
  static const String STACKS_LEVEL_TITLE = 'Poziomy stosu:';
  static const String STACK_TITLE = 'Stos';

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
        URL_BOX_DETAIL: (context) => BoxDetailView(selectedBox)
      },
    );
  }

  void _fillSelectedCarList(){
    DatabaseCars.container.forEach((key, value) {
      selectedCars[key] = true;
    });
  }
}






