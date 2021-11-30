import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/database/library.dart';
import 'package:tobaa/enumerators/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("Add to euro-cargo", () {
    Car car = Car(
      weightOfLoadingArea:
          LoadingAreaWeights(maximum: 15990000, maximumNetExplosive: 1500000),
      type: CarType.smallCarTest,
      carWeights: Weights(gross: 6770000, net: 677000),
      name: 'IVECO - EUROCARGO',
      stacks: [],
      dimensionOfLoadingArea:
          LoadingAreaDimensions(height: 1807, length: 6054, width: 2470),
    );

    Box box = new Box(
        name: "CNU-431",
        capacities: Capacities(maximum: 4),
        weights: BoxWeights(gross: 927000, net: 281000, netExplosive: 232800),
        dimensions: Dimensions(height: 480, width: 968, length: 4416),
        maxTransportStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM120]!,
        type: BoxType.CNU431,
        coordinates: Coordinates());

    Box box2 = new Box(
        name: "CNU-431",
        capacities: Capacities(maximum: 4),
        weights: BoxWeights(gross: 927000, net: 281000, netExplosive: 232800),
        dimensions: Dimensions(height: 480, width: 968, length: 4416),
        maxTransportStackLevel: 2,
        battleAirAsset: DatabaseAssets.container[BattleAirAssetType.AIM120]!,
        type: BoxType.CNU431,
        coordinates: Coordinates());

    box.capacities.fillToMaximum();
    box2.capacities.tryIncreaseCurrent(3);

    car.addBox(box);
    car.addBox(box2);

    expect(car.capacity(), 7);
  });

  test("euro-cargo create stacks and stack levels tests", () {
    Car car = DatabaseCars.container[CarType.euro_cargo]!;
    Box box = Box.specificType(BoxType.CNU431);

    List<Box> boxes = [box, box, box,box, box, box,box, box, box,box, box, box];


    car.addBoxes(boxes);

    expect(car.capacity(), 24);
    expect(car.stacks.length, 2);
    expect(car.stacks.first.levels.length, 2);
  });

  test('Change weight limit', () {
    const double NOT_LIMITED = -1;
    const double DIFFERENT14S_WEIGHT_LIMIT = 15000000.0;
    const double ONE_POINT_TREE_WEIGHT_LIMIT = 5000000.0;
    const double ONE_POINT_TWO_WEIGHT_LIMIT = 3000000.0;
    const double DIFFERENT_11S_WEIGHT_LIMIT = 1000000.0;

    Car car = DatabaseCars.container[CarType.euro_cargo]!;
    car.explosionClass = ExplosionClass(
        explosionSubclass: DatabaseExplosionSubclasses.container[1.4]!,
        compatibilityGroup:
            DatabaseCompatibilityGroup.container[CompatibilityGroupType.S]!);
    expect(car.explosionClass.weightLimit, NOT_LIMITED);

    car.explosionClass.compatibilityGroup =
        DatabaseCompatibilityGroup.container[CompatibilityGroupType.G]!;
    expect(car.explosionClass.weightLimit, DIFFERENT14S_WEIGHT_LIMIT);

    car.explosionClass.explosionSubclass = DatabaseExplosionSubclasses.container[1.3]!;
    expect(car.explosionClass.weightLimit, ONE_POINT_TREE_WEIGHT_LIMIT);

    car.explosionClass.explosionSubclass = DatabaseExplosionSubclasses.container[1.2]!;
    expect(car.explosionClass.weightLimit, ONE_POINT_TWO_WEIGHT_LIMIT);

    car.explosionClass.explosionSubclass = DatabaseExplosionSubclasses.container[1.1]!;
    expect(car.explosionClass.weightLimit, DIFFERENT_11S_WEIGHT_LIMIT);
  });

  test('Change weight limit after add package', () {
    const double DIFFERENT14S_WEIGHT_LIMIT = 15000000.0;
    const double ONE_POINT_TREE_WEIGHT_LIMIT = 5000000.0;
    const double ONE_POINT_TWO_WEIGHT_LIMIT = 3000000.0;
    const double DIFFERENT_11S_WEIGHT_LIMIT = 1000000.0;

    Car car = DatabaseCars.container[CarType.euro_cargo]!;
    var tprrr = DatabaseBoxes.container[BoxType.M548_TPRRR]!;
    tprrr.fillBox(200);

    car.addBox(tprrr);
    // Najwiekszy limit z innego niz 1.4S czyli 15000000
    expect(car.explosionClass.weightLimit, DIFFERENT14S_WEIGHT_LIMIT);

    var mju7a = DatabaseBoxes.container[BoxType.MJU7ABOX]!;
    mju7a.fillBox(60);
    //Dodaje inną klase która ma mniejszy limit 5000000
    car.addBox(mju7a);
    expect(car.explosionClass.weightLimit, ONE_POINT_TREE_WEIGHT_LIMIT);
    //Dodaje z większym limitem i ma pozostać stary limit: 5000000
    car.addBox(tprrr);
    expect(car.explosionClass.weightLimit, ONE_POINT_TREE_WEIGHT_LIMIT);

    var aim120 = DatabaseBoxes.container[BoxType.CNU431]!;
    aim120.fillBox(4);
    //Dodaje inną klase która ma mniejszy limit 3000000
    car.addBox(aim120);
    expect(car.explosionClass.weightLimit, ONE_POINT_TWO_WEIGHT_LIMIT);

    var mk82 = DatabaseBoxes.container[BoxType.MHU149]!;
    mk82.fillBox(6);
    car.addBox(mk82);
    expect(car.explosionClass.weightLimit, DIFFERENT_11S_WEIGHT_LIMIT);
  });
}
