part of database;

class DatabaseBoxes {
  static final Map<BoxType, Box> container = {
    BoxType.CNU672: new Box(
        name: "CNU-672",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(gross: 1034000 , net: 537000, netExplosive: 88900),
        dimensions: Dimensions(height: 787, width: 794, length: 433),
        maxTransportStackLevel: 1,
        maxWarehouseStackLevel: 6,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM154]!,
        type: BoxType.CNU672,
        coordinates: Coordinates()),
    BoxType.CNU614: new Box(
        name: "CNU-614",
        capacities: Capacities(maximum: 1),
        weights:
            BoxWeights(gross: 1483247.1, net: 508023.5, netExplosive: 108862.2),
        dimensions: Dimensions(height: 940, width: 927, length: 4572),
        maxTransportStackLevel: 1,
        maxWarehouseStackLevel: 4,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM158]!,
        type: BoxType.CNU614,
        coordinates: Coordinates()),
    BoxType.CNU445: new Box(
        name: "CNU-445",
        capacities: Capacities(maximum: 1),
        weights: BoxWeights(gross: 503413, net: 197313, netExplosive: 65500),
        dimensions: Dimensions(width: 1016, length: 2743, height: 762),
        maxTransportStackLevel: 1,
        maxWarehouseStackLevel: 6,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AGM65G]!,
        type: BoxType.CNU445,
        coordinates: Coordinates()),
    BoxType.CNU431: new Box(
        name: "CNU-431",
        capacities: Capacities(maximum: 4),
        weights: BoxWeights(gross: 927000, net: 281000, netExplosive: 232800),
        dimensions: Dimensions(height: 480, width: 968, length: 4416),
        maxTransportStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM120]!,
        type: BoxType.CNU431,
        coordinates: Coordinates()),
    BoxType.CNU609: new Box(
        name: "CNU-609",
        capacities: Capacities(maximum: 4),
        weights: BoxWeights(gross: 623495, net: 283495, netExplosive: 123200),
        dimensions: Dimensions(height: 584, width: 1067, length: 3505),
        maxTransportStackLevel: 2,
        maxWarehouseStackLevel: 10,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM9x]!,
        type: BoxType.CNU609,
        coordinates: Coordinates()),
    BoxType.BBU35BOX: new Box(
        name: "Karton z BBU35",
        capacities: Capacities(maximum: 2160),
        weights: BoxWeights(gross: 22600, net: 1000, netExplosive: 793.807624),
        dimensions: Dimensions(height: 285, width: 485, length: 490),
        maxTransportStackLevel: 3,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.BBU35]!,
        type: BoxType.BBU35BOX,
        coordinates: Coordinates()),
    BoxType.BBU36BOX: new Box(
        name: "Karton z BB36",
        capacities: Capacities(maximum: 2160),
        weights: BoxWeights(gross: 37720, net: 1000, netExplosive: 2155.47048),
        dimensions: Dimensions(height: 285, width: 485, length: 490),
        maxTransportStackLevel: 3,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.BBU36]!,
        type: BoxType.BBU36BOX,
        coordinates: Coordinates()),
    BoxType.M2A1: new Box(
        name: "M2A1",
        capacities: Capacities(maximum: 50),
        weights: BoxWeights(gross: 600, net: 400, netExplosive: 158.5),
        dimensions: Dimensions(height: 190, width: 155, length: 295),
        maxTransportStackLevel: 4,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.CXU3]!,
        type: BoxType.M2A1,
        coordinates: Coordinates()),
    BoxType.MJU7ABOX: new Box(
        name: "Skrzynia z MJU7AB",
        capacities: Capacities(maximum: 60),
        weights: BoxWeights(gross: 37000, net: 14800, netExplosive: 17700),
        dimensions: Dimensions(height: 298, width: 429, length: 479),
        maxTransportStackLevel: 3,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.MJU7AB]!,
        type: BoxType.MJU7ABOX,
        coordinates: Coordinates()),
    BoxType.MK79: new Box(
        name: "MK-79",
        capacities: Capacities(maximum: 2),
        weights:
            BoxWeights(gross: 1894000.0, net: 44000.0, netExplosive: 856000.0),
        dimensions: Dimensions(height: 616, width: 965, length: 2515),
        maxTransportStackLevel: 99,
        maxWarehouseStackLevel: 99,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.MK84]!,
        type: BoxType.MK79,
        coordinates: Coordinates()),
    BoxType.MHU149: new Box(
        name: "MHU-149/E",
        capacities: Capacities(maximum: 6),
        weights:
            BoxWeights(gross: 1426000.0, net: 64000.0, netExplosive: 522000.0),
        dimensions: Dimensions(height: 851, width: 902, length: 1575),
        maxTransportStackLevel: 99,
        maxWarehouseStackLevel: 99,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.MK82]!,
        type: BoxType.MHU149,
        coordinates: Coordinates()),
    BoxType.M548_TPRRR: new Box(
        name: "M548 TPRRR",
        capacities: Capacities(maximum: 200),
        weights: BoxWeights(gross: 64850.0, net: 10850.0, netExplosive: 7800.0),
        dimensions: Dimensions(height: 380, width: 211, length: 475),
        maxTransportStackLevel: 2,
        maxWarehouseStackLevel: 3,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.TPRRR]!,
        type: BoxType.M548_TPRRR,
        coordinates: Coordinates()),
    BoxType.M548MPLD: new Box(
        name: "M548 MPLD",
        capacities: Capacities(maximum: 200),
        weights: BoxWeights(gross: 64850.0, net: 10850.0, netExplosive: 9600.0),
        dimensions: Dimensions(height: 380, width: 211, length: 475),
        maxTransportStackLevel: 2,
        maxWarehouseStackLevel: 3,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.MPLD]!,
        type: BoxType.M548MPLD,
        coordinates: Coordinates()),
    BoxType.RR170AL_BOX: new Box(
        name: "Karton z RR170AL",
        capacities: Capacities(maximum: 120),
        weights: BoxWeights(gross: 17800, net: 1000, netExplosive: 43.54486751999988),
        dimensions: Dimensions(height: 265, width: 410, length: 350),
        maxTransportStackLevel: 3,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.RR170AL]!,
        type: BoxType.RR170AL_BOX,
        coordinates: Coordinates()),

  };
}
