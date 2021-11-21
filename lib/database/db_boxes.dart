part of database;

class DatabaseBoxes {
  static final Map<BoxType, Box> container = {
    BoxType.CNU672: new Box(
        name: "CNU-672",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(gross: 523129, net: 523129, netExplosive: 88900),
        dimensions: Dimensions(height: 787, width: 794, length: 4600),
        maxStackLevel: 1,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM154]!,
        type: BoxType.CNU672),
    BoxType.CNU614: new Box(
        name: "CNU-614",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(gross: 497000 + 1, net: 1, netExplosive: 108860),
        dimensions: Dimensions(height: 940, width: 990, length: 4572),
        maxStackLevel: 1,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM158]!,
        type: BoxType.CNU614),
    BoxType.CNU445: new Box(
        name: "CNU-445",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(gross: 503413, net: 197313, netExplosive: 65500),
        dimensions: Dimensions(width: 1016, length: 2743, height: 762),
        maxStackLevel: 1,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM65G]!,
        type: BoxType.CNU445),
    BoxType.CNU431: new Box(
        name: "CNU-431",
        capacities: Capacities(maximum: 4),
        weights: BoxWeights(gross: 927000, net: 281000, netExplosive: 232800),
        dimensions: Dimensions(height: 480, width: 968, length: 4416),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM120]!,
        type: BoxType.CNU431),
    BoxType.CNU609: new Box(
        name: "CNU-609",
        capacities: Capacities(maximum: 4),
        weights: BoxWeights(gross: 623495, net: 283495, netExplosive: 123200),
        dimensions: Dimensions(height: 584, width: 1067, length: 3505),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM9x]!,
        type: BoxType.CNU609),
    BoxType.BBU35BOX: new Box(
        name: "Karton z BBU35",
        capacities: Capacities(maximum: 4),
        weights: BoxWeights(gross: 1, net: 1, netExplosive: 1),
        dimensions: Dimensions(height: 1, width: 1, length: 1),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.BBU35]!,
        type: BoxType.BBU35BOX),
    BoxType.BBU36BOX: new Box(
        name: "Karton z BB36",
        capacities: Capacities(maximum: 4),
        weights: BoxWeights(gross: 1, net: 1, netExplosive: 1),
        dimensions: Dimensions(height: 1, width: 1, length: 1),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.BBU36]!,
        type: BoxType.BBU36BOX),
    BoxType.M2A1: new Box(
        name: "M2A1",
        capacities: Capacities(maximum: 50),
        weights: BoxWeights(gross: 600, net: 400, netExplosive: 158.5),
        dimensions: Dimensions(height: 191, width: 152, length: 298),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.CXU3]!,
        type: BoxType.M2A1),
    BoxType.MJU7ABOX: new Box(
        name: "Skrzynia z MJU7AB",
        capacities: Capacities(maximum: 60),
        weights: BoxWeights(gross: 37000, net: 14800, netExplosive: 15660),
        dimensions: Dimensions(height: 298, width: 429, length: 479),
        maxStackLevel: 3,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.MJU7AB]!,
        type: BoxType.MJU7ABOX),
    BoxType.MK79: new Box(
        name: "MK-79",
        capacities: Capacities(maximum: 2),
        weights:
            BoxWeights(gross: 1854400.0, net: 44000.0, netExplosive: 856000.0),
        dimensions: Dimensions(height: 616, width: 965, length: 2515),
        maxStackLevel: 99,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.MK84]!,
        type: BoxType.MK79),
    BoxType.MHU149: new Box(
        name: "MHU-149/E",
        capacities: Capacities(maximum: 6),
        weights: BoxWeights(gross: 1426000.0, net: 64000.0, netExplosive: 522000.0),
        dimensions: Dimensions(height: 851, width: 902, length: 1575),
        maxStackLevel: 99,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.MK82]!,
        type: BoxType.MHU149),
    BoxType.M548_TPRRR: new Box(
        name: "M548 TPRRR",
        capacities: Capacities(maximum: 200),
        weights: BoxWeights(gross: 64850.0, net: 10850.0, netExplosive: 7800.0),
        dimensions: Dimensions(height: 380, width: 211, length: 475),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.TPRRR]!,
        type: BoxType.M548_TPRRR),
    BoxType.M548MPLD: new Box(
        name: "M548 MPLD",
        capacities: Capacities(maximum: 200),
        weights: BoxWeights(gross: 64850.0, net: 10850.0, netExplosive: 9600.0),
        dimensions: Dimensions(height: 380, width: 211, length: 475),
        maxStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.MPLD]!,
        type: BoxType.M548MPLD),
    BoxType.CHAFF_BOX: new Box(
        name: "Skrzynia z RR170AL",
        capacities: Capacities(maximum: 120),
        weights: BoxWeights(gross: 16800, net: 1000, netExplosive:43.544856),
        dimensions: Dimensions(height: 265, width: 410, length: 350),
        maxStackLevel: 3,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.RR170AL]!,
        type: BoxType.CHAFF_BOX),
  };
}
