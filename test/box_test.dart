import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/battle_air_asset/battle_air_asset.dart';
import 'package:tobaa/box/box.dart';
import 'package:tobaa/capacities/capacities.dart';
import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/enumerators/box_type.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/explosion_class/compatibility_group.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/explosion_class/explosion_subclass.dart';
import 'package:tobaa/weights/box_weights.dart';
import 'package:tobaa/weights/weights.dart';


void main() {
  const String BOX_NAME = "box name";
  const String BAA_NAME = "baa name";
  const int CORRECT_MINIMUM_STACK_LEVEL = 1;
  const double BOX_WEIGHT = 0.3;
  const int MAX_NUMBER_OF_BAA_IN_BOX = 10;
  BattleAirAsset baa = new BattleAirAsset(
    name: BAA_NAME,
    boxType: BoxType.test,
    dimensions: Dimensions(
      width: 1,
      length: 1,
      height: 1
    ),
    explosionClass: ExplosionClass(
      explosionSubclass: ExplosionSubclass(
        id:1,
        description: ""
      ),
      compatibilityGroup: CompatibilityGroup(
        group: CompatibilityGroupType.None
      )
    ),
    type: BattleAirAssetType.test,
    weights: Weights(
      gross: 0.1,
      net: 0.1,
      netExplosive: 0.1
    )
  );


  test("Constructor with proper arguments.", () {
    Box box = new Box(
        name: BOX_NAME,
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: CORRECT_MINIMUM_STACK_LEVEL,
        battleAirAsset: baa,
        type: BoxType.test
    );
    expect(box.name, BOX_NAME);
    expect(box.maxStackLevel, CORRECT_MINIMUM_STACK_LEVEL);
  });

  test("Constructor with proper arguments - minimum stack level equal 0.", () {
    Box box = new Box(
        name: BOX_NAME,
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: 0,
        battleAirAsset: baa,
        type: BoxType.test
    );
    expect(box.name, BOX_NAME);
    expect(box.maxStackLevel, CORRECT_MINIMUM_STACK_LEVEL);
  });

  test("Constructor with proper arguments  - minimum stack level equal -1", () {
    Box box = new Box(
        name: BOX_NAME,
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: -1,
        battleAirAsset: baa,
        type: BoxType.test
    );
    expect(box.name, BOX_NAME);
    expect(box.maxStackLevel, CORRECT_MINIMUM_STACK_LEVEL);
  });

  test("Setters with correct values", () {
    Box box = new Box(
        name: BOX_NAME,
        capacities: Capacities(maximum: 30),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: CORRECT_MINIMUM_STACK_LEVEL,
        battleAirAsset: baa,
        type: BoxType.test
    );
    box.dimensions = new Dimensions(height:1, width:1, length: 1);
    expect(box.dimensions.capacity, 1);

    box.weights = new BoxWeights(net: 1.0, gross: 2.0, netExplosive: 1.0);
    expect(box.weights.net, 1.0);

    box.capacities = new Capacities(maximum: 1);
    expect(box.capacities.maximum, 1);
  });
  test("Fill to maximum TPRRR", () {
    
    Box box = DatabaseBoxes.container[BoxType.M548_TPRRR]!;
    box.fillBox(100);

    expect(box.weights.currentNetExplosive, 3900.0);
    expect(box.weights.net, 10850.0);
    expect(box.weights.currentGross, 37850.0);
    expect(box.capacities.current, 100);
    expect(box.capacities.isFull, false);

    box.fillBox(100);

    expect(box.weights.currentNetExplosive, 7800.0);
    expect(box.weights.net, 10850.0);
    expect(box.weights.currentGross, 64850.0);
    expect(box.capacities.current, 200);
    expect(box.capacities.isFull, true);
  });


  test("Fill to maximum.", () {
    Box box = new Box(
        name: BOX_NAME,
        capacities: Capacities(maximum: 10),
        weights: BoxWeights(
            gross: 31,
            net: 1,
            netExplosive: 30
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: CORRECT_MINIMUM_STACK_LEVEL,
        battleAirAsset: baa,
        type: BoxType.test
    );

    box.fillToMaximum();

    expect(box.weights.currentNetExplosive, box.weights.netExplosive);
    expect(box.weights.currentGross, box.weights.gross);
    expect(box.capacities.current, MAX_NUMBER_OF_BAA_IN_BOX);
    expect(box.capacities.current, box.capacities.maximum);
    expect(box.capacities.isFull, true);
  });

  test("Fill box function.", (){
    const double BAA_WEIGHT = 1.0;
    const double BOX_NET_WEIGHT = 1.0;
    const double BOX_GROSS_WEIGHT = 14.0;
    const double BOX_NET_EXPLOSIVE_WEIGHT = 10.0;
    const int BOX_MAX_STACK_LEVEL = 2;
    const String BOX_NAME = "box";
    const String BAA_NAME = "New baa";

    BattleAirAsset baa = new BattleAirAsset(
        name: BAA_NAME,
        boxType: BoxType.test,
        dimensions: Dimensions(
            width: 1,
            length: 1,
            height: 1
        ),
        explosionClass: ExplosionClass(
            explosionSubclass: ExplosionSubclass(
                id:1,
                description: ""
            ),
            compatibilityGroup: CompatibilityGroup(
                group: CompatibilityGroupType.None
            )
        ),
        type: BattleAirAssetType.test,
        weights: Weights(
            gross: BAA_WEIGHT,
            net: BAA_WEIGHT,
            netExplosive: BAA_WEIGHT
        )
    );

    Box box = new Box(
        name: BOX_NAME,
        capacities: Capacities(maximum: MAX_NUMBER_OF_BAA_IN_BOX),
        weights: BoxWeights(
            gross: BOX_GROSS_WEIGHT,
            net: BOX_NET_WEIGHT,
            netExplosive: BOX_NET_EXPLOSIVE_WEIGHT
        ),
        dimensions: Dimensions(
            height: 3,
            width: 1,
            length: 10
        ),
        maxStackLevel: BOX_MAX_STACK_LEVEL,
        battleAirAsset: baa,
        type: BoxType.test
    );


    var fillBoxOneBaa = 1;
    var currentGrossWhenIncreaseOneBaa = 2.0;
    var currentNetExplosiveWhenIncreaseOneBaa = 1.0;
    var currentCapacityWhenIncreaseOneBaa = 1;

    box.fillBox(fillBoxOneBaa);

    expect(box.weights.currentGross, currentGrossWhenIncreaseOneBaa);
    expect(box.weights.currentNetExplosive, currentNetExplosiveWhenIncreaseOneBaa);
    expect(box.capacities.current, currentCapacityWhenIncreaseOneBaa);
    expect(box.capacities.isFull, false);

    var fillBoxToMaxCapacity = 9;
    var currentGrossWhenIncreaseTenBaa = 11.0;
    var currentNetExplosiveWhenIncreaseTenBaa = 10.0;
    var currentCapacityWhenIncreaseTenBaa = 10;

    box.fillBox(fillBoxToMaxCapacity);

    expect(box.weights.currentGross, currentGrossWhenIncreaseTenBaa);
    expect(box.weights.currentNetExplosive, currentNetExplosiveWhenIncreaseTenBaa);
    expect(box.capacities.current, currentCapacityWhenIncreaseTenBaa);
    expect(box.capacities.isFull, true);

    var fillBoxOverMaxCapacity = 1;

    box.fillBox(fillBoxOverMaxCapacity);

    expect(box.weights.currentGross, currentGrossWhenIncreaseTenBaa);
    expect(box.weights.currentNetExplosive, currentNetExplosiveWhenIncreaseTenBaa);
    expect(box.capacities.current, currentCapacityWhenIncreaseTenBaa);
    expect(box.capacities.isFull, true);

  });

}