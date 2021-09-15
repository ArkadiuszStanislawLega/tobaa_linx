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

  test("getters", () {
    Transport transport = new Transport();

    transport.addCar(CarType.test);
    expect(transport.numberOfCars, 1);

    Map<BattleAirAssetType, int> map = new Map <BattleAirAssetType, int>();
    map[BattleAirAssetType.test] = 10;

    transport.createTransport(map);
    expect(transport.numberOfCars, 1);

    transport = new Transport();
    map.clear();

    transport.addCar(CarType.test);
    map[BattleAirAssetType.heavyTest] = 1;
    transport.createTransport(map);

    //TODO:Przetestować to
    // expect(transport.cars[0].stacks[0].currentNumberOfBoxes, 1);
  });

}