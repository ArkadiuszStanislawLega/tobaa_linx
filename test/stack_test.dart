import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/database/library.dart';
import 'package:tobaa/enumerators/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("Constructor", () {
    StackLevel stackLevel = StackLevel(
        dimensions: StackDimensions(height: 1, length: 5, width: 3),
        weights: StackWeights(maxNetExplosion: 15, maxGross: 33, maxNet: 30),
        capacities: Capacities(maximum: 30));

    var maximumStackLevel;
    var dimensions;
    var weights;
    var battleAirAssetCapacities;
    var defaultStackLevel;

    WarehouseStack stack = new WarehouseStack(
        maximumStackLevel: maximumStackLevel,
        dimensions: dimensions,
        weights: weights,
        battleAirAssetCapacities: battleAirAssetCapacities,
        defaultStackLevel: defaultStackLevel);
    WarehouseStack(
        maximumStackLevel: 2,
        dimensions: StackDimensions(height: 1, width: 1, length: 5),
        weights:
            StackWeights(maxNet: 1.0, maxGross: 33.0, maxNetExplosion: 15.0),
        battleAirAssetCapacities: Capacities(maximum: 30),
        defaultStackLevel: stackLevel);
    expect(stack.battleAirAssetCapacities.isFull, false);
    expect(stack.weights.gross, 0.0);
    expect(stack.dimensions.capacity, 5);
  });

  test('Fill maverics', () {
    var stack = WarehouseStack.cnu445();
    stack.addBox(Box.cnu445f());

    expect(stack.battleAirAssetCapacities.current, 1);
    expect(stack.weights.gross, 503413.0);
    expect(stack.weights.net, 306100.0);
    expect(stack.weights.netExplosive, 65500.0);
    expect(stack.dimensions.length, 2743);
    expect(stack.dimensions.width, 1016);
    expect(stack.dimensions.height, 762);
    expect(stack.currentNumberOfBoxes, 1);
  });


  test("Stack with MJU7A/B", () {
    const int MAX_NUMBER_OF_BOXES_IN_STACK = 18;
    WarehouseStack stack = DatabaseStacks.container[BoxType.MJU7ABOX]!;
    Box box = DatabaseBoxes.container[BoxType.MJU7ABOX]!;
    List<Box> boxes = [];

    box.fillBox(box.capacities.maximum);

    for (int i = 0; i < MAX_NUMBER_OF_BOXES_IN_STACK; i++) {
      boxes.add(box);
    }

    expect(stack.isBoxesCanBeAddedToStack(boxes), true);
    stack.addAllBoxes(boxes);

    expect(stack.levels.length, 1);
    expect(stack.levels.first.capacities.current, 1080);
    expect(stack.battleAirAssetCapacities.current, 1080);
    expect(stack.weights.net, 399600);
    expect(stack.weights.gross, 666000);
    expect(stack.weights.netExplosive, 318600);
  });
}
