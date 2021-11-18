import 'package:tobaa/constants/app_strings.dart';
import 'package:tobaa/enumerators/combat_asset_type.dart';

String converterCombatAssetsTypeToString(CombatAssetType combatAssetType){
  switch (combatAssetType){
    case CombatAssetType.none:
      return 'Brak';
    case CombatAssetType.pyrotechnic:
      return Strings.PYROTECHNIC;
    case CombatAssetType.bomb:
      return Strings.BOMB;
    case CombatAssetType.rocket:
      return Strings.ROCKET;
    case CombatAssetType.ammo:
      return Strings.AMMO;
  }
}