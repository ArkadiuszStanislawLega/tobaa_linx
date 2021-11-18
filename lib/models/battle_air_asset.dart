part of models;

class BattleAirAsset {
  late String name;
  late ExplosionClass explosionClass;
  late Dimensions dimensions;
  late Weights weights;
  late BattleAirAssetType type;
  late BoxType boxType;
  late CombatAssetType combatAssetType;

  BattleAirAsset.empty() {
    this.name = "";
    this.explosionClass = ExplosionClass.empty();
    this.dimensions = Dimensions();
    this.weights = Weights();
    this.type = BattleAirAssetType.None;
    this.boxType = BoxType.None;
    this.combatAssetType = CombatAssetType.none;
  }

  BattleAirAsset(
      {required this.name,
      required this.explosionClass,
      required this.dimensions,
      required this.weights,
      required this.type,
      required this.boxType,
      required this.combatAssetType});
}
