import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/enumerators/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("Constructor with no args.", () {
    Transport transport = new Transport();
    expect(transport.isWarTime, false);
    expect(transport.numberOfCars, 0);
    expect(transport.transportGrossWeight, 0);
    expect(transport.transportNetExplosiveWeight, 0);
    expect(transport.transportNetWeight, 0);
  });

  test("Create transport in war time", (){
    Transport transport = new Transport();
    transport.selectedCar = CarType.euro_cargo;
    transport.isWarTime = true;
    expect(transport.isWarTime, true);

    transport.createTransport({BattleAirAssetType.TPRRR : 27000});
    expect(transport.numberOfBaa, 27000);
    expect(transport.cars.length, 1);
    expect(transport.numberOfBoxes, 135);

    transport.createTransport({BattleAirAssetType.TPRRR : 54000});
    expect(transport.cars.length, 2);
    expect(transport.numberOfBoxes, 270);
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
    tr.createTransport({BattleAirAssetType.AIM120: 8});
    tr.clear();

    expect(tr.cars.length, 0);
    expect(tr.numberOfCars, 0);
    expect(tr.transportGrossWeight, 0);
    expect(tr.transportNetExplosiveWeight, 0);
    expect(tr.transportNetWeight, 0);

    tr.createTransport({BattleAirAssetType.AIM120: 28});
    expect(tr.capacity(), 28);
  });

  test("Create transport with more then 3 euro-cargos with CNU431", () {
    //Do jednego eurocargo wchodzą dwa kontenery CNU431

    Transport tr = new Transport();
    tr.selectedCar = CarType.euro_cargo;
    tr.createTransport({BattleAirAssetType.AIM120: 40});
    expect(tr.capacity(), 40);
    expect(tr.cars.length, 5);
  });

  test("Two type of boxes", () {
    Transport tr = new Transport();
    tr.selectedCar = CarType.euro_cargo;
    tr.createTransport(
        {BattleAirAssetType.AIM120: 20,
          BattleAirAssetType.AIM9x: 20});
    expect(tr.capacity(), 40);
    expect(tr.cars.length, 5);
  });

  test("Transport with AGM154", () {
    Transport tr = new Transport();
    tr.selectedCar = CarType.euro_cargo;
    tr.createTransport(
        {BattleAirAssetType.AGM154: 1});
    expect(tr.capacity(), 1);
    expect(tr.cars.length, 1);
  });

  test("Transport with RR170A/AL", () {
    Transport tr = new Transport();
    tr.selectedCar = CarType.euro_cargo;
    tr.createTransport({BattleAirAssetType.RR170AL: 1});
    expect(tr.capacity(), 1);
    expect(tr.cars.length, 1);
  });

  test("RR170A/AL", () {
    Transport tr = new Transport();
    tr.selectedCar = CarType.euro_cargo;
    tr.createTransport({BattleAirAssetType.RR170AL: 2160});
    tr.isWarTime = false;
    expect(tr.capacity(), 2160);
    expect(tr.cars.length, 1);
  });
}
