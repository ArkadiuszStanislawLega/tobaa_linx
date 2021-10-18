import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/transport/transport.dart';

void main() {
  test("Constructor with no args.", () {
    Transport transport = new Transport();
    expect(transport.isWarTime, false);
    expect(transport.numberOfCars, 0);
    expect(transport.transportGrossWeight, 0);
    expect(transport.transportNetExplosiveWeight, 0);
    expect(transport.transportNetWeight, 0);
  });

  test("Create transport", () {
    // Transport transport = new Transport();
    //
    // transport.addCar(CarType.euro_cargo);
    // expect(transport.numberOfCars, 1);
    //
    // Map<BattleAirAssetType, int> map = new Map <BattleAirAssetType, int>();
    // map[BattleAirAssetType.AGM65G] = 10;
    //
    // transport.createTransport(map);
    // expect(transport.numberOfCars, 1);
    //
    // transport = new Transport();
    // map.clear();

    // transport.addCar(CarType.test);
    // map[BattleAirAssetType.heavyTest] = 1;
    // transport.createTransport(map);
    Transport tr = new Transport();
    tr.selectedCar = CarType.euro_cargo;
    tr.createTransport({ BattleAirAssetType.AIM120 : 8});
    tr.clear();

    expect(tr.cars.length, 0);
    expect(tr.numberOfCars, 0);
    expect(tr.transportGrossWeight, 0);
    expect(tr.transportNetExplosiveWeight, 0);
    expect(tr.transportNetWeight, 0);

    tr.createTransport({ BattleAirAssetType.AIM120 : 28});
    expect(tr.capacity(), 28);


  });

  test("Create transport with more then one car", () {
    Transport tr = new Transport();
    tr.selectedCar = CarType.euro_cargo;
    tr.createTransport({ BattleAirAssetType.AIM120 : 16});
    expect(tr.capacity(), 16);
    expect(tr.cars.length, 2);
  });

  test("Create transport with more then 3 euro-cargos with CNU431", () {
    Transport tr = new Transport();
    tr.selectedCar = CarType.euro_cargo;
    tr.createTransport({ BattleAirAssetType.AIM120 : 40});
    expect(tr.capacity(), 40);
    expect(tr.cars.length, 5);
  });
}