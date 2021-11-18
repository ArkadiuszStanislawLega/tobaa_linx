import 'package:flutter/material.dart';
import 'package:tobaa/widgets/Pages/DetailViews/baa_detail_view.dart';
import 'package:tobaa/widgets/Pages/DetailViews/box_detail_view.dart';
import 'package:tobaa/widgets/Pages/DetailViews/car_detail_view.dart';
import 'package:tobaa/widgets/Pages/DetailViews/stack_detail_view.dart';
import 'package:tobaa/widgets/Pages/DetailViews/stack_level_detail_view.dart';
import 'package:tobaa/widgets/Pages/DetailViews/transport_detail_view.dart';
import 'package:tobaa/widgets/Pages/counted_view.dart';
import 'package:tobaa/widgets/Pages/select_view.dart';
import 'package:tobaa/widgets/Pages/settings_view.dart';

import 'constants/library.dart';
import 'database/library.dart';
import 'enumerators/library.dart';
import 'models/library.dart';


void main() {
  runApp(TOBAAApp());
}

class TOBAAApp extends StatelessWidget {
  static BattleAirAssetType index = BattleAirAssetType.None;

  //Flaga wskazująca czy obliczenia mają zostać zrobione dla czasu wojny, czy pokoju
  static bool isWar = false;

  //Mapa z wartościami jakie użytkownik wybrał dla danego środka bojowego
  static Map<BattleAirAssetType, int> values = {};

  //Mapa z wybranymi pojazdami do obliczeń
  static Map<CarType, bool> selectedCars = {};

  //Mapa z przeliczonymi tranportami
  static Map<CarType, Transport> transports = {};

  @override
  Widget build(BuildContext context) {
    this._fillSelectedCarList();
    return MaterialApp(
      title: 'Organizator transportu środków bojowych',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: Url.HOME,
      routes: {
        Url.EMPTY: (context) => SelectView(),
        Url.HOME: (context) => SelectView(),
        Url.DETAIL: (context) => DetailBaa(DatabaseAssets.container[index]!),
        Url.SETTINGS: (context) => SettingsView(),
        Url.COUNTED: (context) => CountedView(),
        Url.CAR_DETAIL: (context) => CarDetailView(),
        Url.STACK_DETAIL: (context) => StackDetailView(),
        Url.STACK_LEVEL_DETAIL: (context) => StackLevelDetailView(),
        Url.BOX_DETAIL: (context) => BoxDetailView(),
        Url.TRANSPORT_DETAIL: (context) => TransportDetailView(),
      },
    );
  }


  void _fillSelectedCarList() {
    DatabaseCars.container.forEach((key, value) {
      selectedCars[key] = true;
    });
  }
}
