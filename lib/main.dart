import 'package:flutter/material.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/widgets/baa_list.dart';
import 'package:tobaa/widgets/detail_baa_view.dart';
import 'enumerators/baa_type.dart';


void main() {
  runApp(TOBAAApp());
}

class TOBAAApp extends StatelessWidget {
  static BattleAirAssetType index = BattleAirAssetType.None;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transporting Organiser of Battle Air Assets',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      initialRoute: '/home',
      routes: {
        '/' : (context) => BaaList(),
        '/home': (context) => BaaList(),
        '/detail' : (context) => DetailBaa(DatabaseAssets.container[index]!)
      },
    );
  }
}






