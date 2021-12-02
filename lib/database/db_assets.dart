part of database;

class DatabaseAssets {
  static Map<BattleAirAssetType, BattleAirAsset> container = {
    //TODO: Sprawdzić wagę netto jsow-a i jassma
    BattleAirAssetType.AGM154: new BattleAirAsset(
        type: BattleAirAssetType.AGM154,
        boxType: BoxType.CNU672,
        name: "AGM-154C JSOW",
        materialIdentificationNumber: DatabaseUnCodes.container[34]!,
        hexogeneEquivalent: 69.23,
        weights: Weights(gross: 497000, net: 497000, netExplosive: 88900),
        dimensions: Dimensions(height: 533, length: 4064, width: 419),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!),
        combatAssetType: CombatAssetType.rocket),

    BattleAirAssetType.AGM158: new BattleAirAsset(
        type: BattleAirAssetType.AGM158,
        boxType: BoxType.CNU614,
        name: "AGM-158-6 JASSM",
        materialIdentificationNumber: DatabaseUnCodes.container[34]!,
        hexogeneEquivalent: 0.0,
        weights:
            Weights(gross: 975223.6, netExplosive: 108862.2, net: 975223.6),
        dimensions: Dimensions(height: 508, length: 4267, width: 632),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.J]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!),
        combatAssetType: CombatAssetType.rocket),

    BattleAirAssetType.AGM65G: BattleAirAsset(
        type: BattleAirAssetType.AGM65G,
        boxType: BoxType.CNU445,
        name: "AGM-65G2 MAVERIC",
        materialIdentificationNumber: DatabaseUnCodes.container[181]!,
        hexogeneEquivalent: 50.59,
        weights: Weights(gross: 306100, netExplosive: 65500, net: 306100),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!),
        combatAssetType: CombatAssetType.rocket),

    BattleAirAssetType.AIM9x: new BattleAirAsset(
        type: BattleAirAssetType.AIM9x,
        boxType: BoxType.CNU609,
        name: "AIM-9X SIDEWINDER",
        materialIdentificationNumber: DatabaseUnCodes.container[181]!,
        hexogeneEquivalent: 23.69,
        weights: Weights(gross: 85000, netExplosive: 30800, net: 85000),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.E]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!),
        combatAssetType: CombatAssetType.rocket),

    BattleAirAssetType.AIM120: new BattleAirAsset(
        type: BattleAirAssetType.AIM120,
        boxType: BoxType.CNU431,
        name: "AIM-120 C5 AMRAAM",
        materialIdentificationNumber: DatabaseUnCodes.container[181]!,
        hexogeneEquivalent: 46.07,
        weights: Weights(gross: 161500, netExplosive: 58200, net: 161500),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.E]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.2]!),
        combatAssetType: CombatAssetType.rocket),

    BattleAirAssetType.BBU35: new BattleAirAsset(
        type: BattleAirAssetType.BBU35,
        boxType: BoxType.BBU35BOX,
        name: "BBU-35/B",
        materialIdentificationNumber: DatabaseUnCodes.container[454]!,
        hexogeneEquivalent: 0.3,
        weights: Weights(gross: 10, netExplosive: 0.3628739, net: 10),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.S]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!),
        combatAssetType: CombatAssetType.pyrotechnic),

    BattleAirAssetType.BBU36: new BattleAirAsset(
        type: BattleAirAssetType.BBU36,
        boxType: BoxType.BBU36BOX,
        name: "BBU-36/B",
        materialIdentificationNumber: DatabaseUnCodes.container[454]!,
        hexogeneEquivalent: 0.7,
        weights: Weights(gross: 17, netExplosive: 0.997903, net: 17),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.S]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!),
        combatAssetType: CombatAssetType.pyrotechnic),
    //TODO: Sprawdzić wagę cxu 0.0032
    BattleAirAssetType.CXU3: new BattleAirAsset(
        type: BattleAirAssetType.CXU3,
        boxType: BoxType.M2A1,
        name: "CXU-3A/B",
        materialIdentificationNumber: DatabaseUnCodes.container[197]!,
        hexogeneEquivalent: 0.0017,
        weights: Weights(gross: 4, netExplosive: 3.17, net: 4),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.G]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!),
        combatAssetType: CombatAssetType.pyrotechnic),

    BattleAirAssetType.MJU7AB: new BattleAirAsset(
        type: BattleAirAssetType.MJU7AB,
        boxType: BoxType.MJU7ABOX,
        name: "MJU-7A/B",
        materialIdentificationNumber: DatabaseUnCodes.container[93]!,
        hexogeneEquivalent: 219.1,
        weights: Weights(gross: 370, netExplosive: 295, net: 370),
        dimensions: Dimensions(height: 205, length: 52, width: 25),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.G]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.3]!),
        combatAssetType: CombatAssetType.pyrotechnic),

    BattleAirAssetType.MK82: new BattleAirAsset(
        type: BattleAirAssetType.MK82,
        boxType: BoxType.MHU149,
        name: "MK-82",
        materialIdentificationNumber: DatabaseUnCodes.container[34]!,
        hexogeneEquivalent: 86990,
        weights: Weights(gross: 227000, netExplosive: 87000, net: 227000),
        dimensions: Dimensions(height: 1, length: 1575, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!),
        combatAssetType: CombatAssetType.bomb),

    BattleAirAssetType.MK84: new BattleAirAsset(
        type: BattleAirAssetType.MK84,
        boxType: BoxType.MK79,
        name: "MK-84",
        materialIdentificationNumber: DatabaseUnCodes.container[34]!,
        hexogeneEquivalent: 329400.0,
        weights:
            Weights(gross: 925000.0, netExplosive: 428000.0, net: 925000.0),
        dimensions: Dimensions(height: 1, length: 2515, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.D]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.1]!),
        combatAssetType: CombatAssetType.bomb),

    BattleAirAssetType.MPLD: new BattleAirAsset(
        type: BattleAirAssetType.MPLD,
        boxType: BoxType.M548MPLD,
        name: "20 mm MP LD M70 A1",
        materialIdentificationNumber: DatabaseUnCodes.container[9]!,
        hexogeneEquivalent: 0.0369,
        weights: Weights(gross: 270, netExplosive: 48, net: 270),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.G]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.2]!),
        combatAssetType: CombatAssetType.ammo),

    BattleAirAssetType.TPRRR: new BattleAirAsset(
        type: BattleAirAssetType.TPRRR,
        boxType: BoxType.M548_TPRRR,
        name: "20 mm TP RRR LD M2",
        materialIdentificationNumber: DatabaseUnCodes.container[339]!,
        hexogeneEquivalent: 0.0315,
        weights: Weights(gross: 270, netExplosive: 39, net: 270),
        dimensions: Dimensions(height: 1, length: 1, width: 1),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.C]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!),
        combatAssetType: CombatAssetType.ammo),

    BattleAirAssetType.RR170AL: new BattleAirAsset(
        type: BattleAirAssetType.RR170AL,
        boxType: BoxType.RR170AL_BOX,
        name: "RR-170A/AL",
        materialIdentificationNumber: MaterialIdentificationNumber.empty(),
        hexogeneEquivalent: 0,
        weights: Weights(gross: 140, netExplosive: 0.362873896, net: 140),
        dimensions: Dimensions(height: 205, length: 25, width: 25),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.S]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!),
        combatAssetType: CombatAssetType.pyrotechnic),

    BattleAirAssetType.MK4MOD3: new BattleAirAsset(
        type: BattleAirAssetType.MK4MOD3,
        boxType: BoxType.M2A1,
        name: "MK4MOD3",
        materialIdentificationNumber: MaterialIdentificationNumber.empty(),
        hexogeneEquivalent: 0,
        weights: Weights(gross: 140, netExplosive: 281, net: 140),
        dimensions: Dimensions(height: 205, length: 0, width: 25),
        explosionClass: ExplosionClass(
            compatibilityGroup:
                DatabaseCompatibilityGroup.container[CompatibilityGroupType.S]!,
            explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!),
        combatAssetType: CombatAssetType.pyrotechnic),
  };
}
