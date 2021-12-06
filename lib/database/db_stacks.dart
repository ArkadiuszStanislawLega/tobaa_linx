part of database;

class DatabaseStacks {
  static final StackLevel _cnu431 = DatabaseStackLevels.container[BoxType.CNU431]!;
  static final StackLevel _cnu609 = DatabaseStackLevels.container[BoxType.CNU609]!;
  static final StackLevel _cnu445 = DatabaseStackLevels.container[BoxType.CNU445]!;
  static final StackLevel _cnu614 = DatabaseStackLevels.container[BoxType.CNU614]!;
  static final StackLevel _cnu672 = DatabaseStackLevels.container[BoxType.CNU672]!;
  static final StackLevel _m54TPRRR = DatabaseStackLevels.container[BoxType.M548_TPRRR]!;
  static final StackLevel _m54MPLD = DatabaseStackLevels.container[BoxType.M548MPLD]!;
  static final StackLevel _mk79 = DatabaseStackLevels.container[BoxType.MK79]!;
  static final StackLevel _mhu149 = DatabaseStackLevels.container[BoxType.MHU149]!;
  static final StackLevel _mju7ab = DatabaseStackLevels.container[BoxType.MJU7ABOX]!;
  static final StackLevel _rr170al = DatabaseStackLevels.container[BoxType.RR170AL_BOX]!;
  static final StackLevel _bbu35 = DatabaseStackLevels.container[BoxType.BBU35BOX]!;
  static final StackLevel _bbu36 = DatabaseStackLevels.container[BoxType.BBU36BOX]!;
  static final StackLevel _cxu = DatabaseStackLevels.container[BoxType.M2A1]!;
  static final Map<BoxType, WarehouseStack> container = {
    BoxType.CNU431: WarehouseStack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 8),
      defaultStackLevel: _cnu431,
      weights: StackWeights(
          maxGross: 2 * _cnu431.weights.maxGross,
          maxNet: 2 * _cnu431.weights.maxNet,
          maxNetExplosion: 2 * _cnu431.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cnu431.dimensions.length, width: _cnu431.dimensions.width, height: 2 * _cnu431.dimensions.height),
    ),
    BoxType.CNU609: WarehouseStack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 8),
      defaultStackLevel: _cnu609,
      weights: StackWeights(
          maxGross: 2 * _cnu609.weights.maxGross,
          maxNet: 2 * _cnu609.weights.maxNet,
          maxNetExplosion: 2 * _cnu609.weights.maxNetExplosion),
      dimensions: StackDimensions(
        length: _cnu609.dimensions.length,
        width: _cnu609.dimensions.width,
        height: 2 * _cnu609.dimensions.height,
      ),
    ),
    BoxType.CNU445: WarehouseStack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 1),
      defaultStackLevel: _cnu445,
      weights: StackWeights(
          maxGross: _cnu445.weights.maxGross,
          maxNet: _cnu445.weights.maxNet,
          maxNetExplosion: _cnu445.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cnu445.dimensions.length,
          width: _cnu445.dimensions.width,
          height: 1524 // maximum stack level * stack level height
          ),
    ),
    BoxType.CNU614: WarehouseStack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 1),
      defaultStackLevel: _cnu614,
      weights: StackWeights(
          maxGross: _cnu614.weights.maxGross,
          maxNet: _cnu614.weights.maxNet,
          maxNetExplosion: _cnu614.weights.maxNetExplosion),
      dimensions: StackDimensions(
        length: _cnu614.dimensions.length,
        width: _cnu614.dimensions.width,
        height: _cnu614.dimensions.height,
      ),
    ),
    BoxType.CNU672: WarehouseStack(
      maximumStackLevel: 2,
      battleAirAssetCapacities: Capacities(maximum: 1),
      defaultStackLevel: _cnu672,
      weights: StackWeights(
          maxGross: _cnu672.weights.maxGross,
          maxNet: _cnu672.weights.maxNet,
          maxNetExplosion: _cnu672.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cnu672.dimensions.length, width: _cnu672.dimensions.width, height: _cnu672.dimensions.height),
    ),
    BoxType.M548_TPRRR: WarehouseStack(
      maximumStackLevel: 1,
      battleAirAssetCapacities: Capacities(maximum: 1800),
      defaultStackLevel: _m54TPRRR,
      weights: StackWeights(
          maxGross: _m54TPRRR.weights.maxGross,
          maxNet: _m54TPRRR.weights.maxNet,
          maxNetExplosion: _m54TPRRR.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _m54TPRRR.dimensions.length, width: _m54TPRRR.dimensions.width, height: _m54TPRRR.dimensions.height),
    ),
    BoxType.M548MPLD: WarehouseStack(
      maximumStackLevel: 1,
      battleAirAssetCapacities: Capacities(maximum: 1800),
      defaultStackLevel: _m54MPLD,
      weights: StackWeights(
          maxGross: _m54MPLD.weights.maxGross,
          maxNet: _m54MPLD.weights.maxNet,
          maxNetExplosion: _m54MPLD.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _m54MPLD.dimensions.length, width: _m54MPLD.dimensions.width, height: _m54MPLD.dimensions.height),
    ),
    BoxType.MK79: WarehouseStack(
      maximumStackLevel: 99,
      battleAirAssetCapacities: Capacities(maximum: 198),
      defaultStackLevel: _mk79,
      weights: StackWeights(
          maxGross: _mk79.weights.maxGross,
          maxNet: _mk79.weights.maxNet,
          maxNetExplosion: _mk79.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _mk79.dimensions.length, width: _mk79.dimensions.width, height: _mk79.dimensions.height),
    ),
    BoxType.MHU149: WarehouseStack(
      maximumStackLevel: 99,
      battleAirAssetCapacities: Capacities(maximum: 594),
      defaultStackLevel: _mhu149,
      weights: StackWeights(
          maxGross: _mhu149.weights.maxGross,
          maxNet: _mhu149.weights.maxNet,
          maxNetExplosion: _mhu149.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _mhu149.dimensions.length, width: _mhu149.dimensions.width, height: _mhu149.dimensions.height),
    ),
    BoxType.MJU7ABOX: WarehouseStack(
      maximumStackLevel: 3,
      battleAirAssetCapacities: Capacities(maximum: 1080),
      defaultStackLevel: _mju7ab,
      weights: StackWeights(
          maxGross: 3 * _mju7ab.weights.maxGross,
          maxNet: 3 * _mju7ab.weights.maxNet,
          maxNetExplosion: 3 * _mju7ab.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _mju7ab.dimensions.length, width: _mju7ab.dimensions.width, height: 3 * _mju7ab.dimensions.height),
    ),
    BoxType.RR170AL_BOX: WarehouseStack(
      maximumStackLevel: 3,
      battleAirAssetCapacities: Capacities(maximum: 2160),
      defaultStackLevel: _rr170al,
      weights: StackWeights(
          maxGross: 3 * _rr170al.weights.maxGross,
          maxNet: 3 * _rr170al.weights.maxNet,
          maxNetExplosion: 3 * _rr170al.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _rr170al.dimensions.length,
          width: _rr170al.dimensions.width,
          height: 3 * _rr170al.dimensions.height + 140),
    ),
    BoxType.BBU35BOX: WarehouseStack(
      maximumStackLevel: 3,
      battleAirAssetCapacities: Capacities(maximum: 38880),
      defaultStackLevel: _bbu35,
      weights: StackWeights(
          maxGross: 3 * _bbu35.weights.maxGross,
          maxNet: 3 * _bbu35.weights.maxNet,
          maxNetExplosion: 3 * _bbu35.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _bbu35.dimensions.length,
          width: _bbu35.dimensions.width,
          height: 3 * _bbu35.dimensions.height + 140),
    ),
    BoxType.BBU36BOX: WarehouseStack(
      maximumStackLevel: 3,
      battleAirAssetCapacities: Capacities(maximum: 38880),
      defaultStackLevel: _bbu36,
      weights: StackWeights(
          maxGross: 3 * _bbu36.weights.maxGross,
          maxNet: 3 * _bbu36.weights.maxNet,
          maxNetExplosion: 3 * _bbu36.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _bbu36.dimensions.length,
          width: _bbu36.dimensions.width,
          height: 3 * _bbu36.dimensions.height + 140),
    ),
    BoxType.M2A1: WarehouseStack(
      maximumStackLevel: 4,
      battleAirAssetCapacities: Capacities(maximum: 4000),
      defaultStackLevel: _cxu,
      weights: StackWeights(
          maxGross: 4 * _cxu.weights.maxGross,
          maxNet: 4 * _cxu.weights.maxNet,
          maxNetExplosion: 4 * _cxu.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: _cxu.dimensions.length,
          width: _cxu.dimensions.width,
          height: 4 * _cxu.dimensions.height + 140),
    ),
  };
}
