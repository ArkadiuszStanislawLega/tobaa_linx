import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/database/library.dart';
import 'package:tobaa/enumerators/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
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

  test('Stack with AIM9X', (){
    WarehouseStack stack = DatabaseStacks.container[BoxType.CNU609]!;
    Box box = DatabaseBoxes.container[BoxType.CNU609]!;
    box.fillToMaximum();

    expect(stack.isBoxCanBeAddedToStack(box), true);
    stack.addBox(box);

    expect(stack.battleAirAssetCapacities.current, 4);
    expect(stack.dimensions.length, box.dimensions.length);
    expect(stack.dimensions.width, box.dimensions.width);
    expect(stack.dimensions.height, box.dimensions.height);
    expect(stack.weights.net, 4*85000);
    expect(stack.weights.gross, box.weights.gross);
    expect(stack.weights.netExplosive, box.weights.netExplosive);

    expect(stack.isBoxCanBeAddedToStack(box), true);
    stack.addBox(box);

    expect(stack.levels.length, 2);
    expect(stack.battleAirAssetCapacities.current, 8);
    expect(stack.dimensions.length, box.dimensions.length);
    expect(stack.dimensions.width, box.dimensions.width);
    expect(stack.dimensions.height, 2*box.dimensions.height);
    expect(stack.weights.net, stack.weights.maxNet);
    expect(stack.weights.gross, stack.weights.maxGross);
    expect(stack.weights.netExplosive, stack.weights.maxNetExplosion);
  });

  test('Stack with aim120', (){
    WarehouseStack stack = DatabaseStacks.container[BoxType.CNU431]!;
    Box box = DatabaseBoxes.container[BoxType.CNU431]!;
    box.fillToMaximum();

    expect(stack.isBoxCanBeAddedToStack(box), true);
    stack.addBox(box);

    expect(stack.battleAirAssetCapacities.current, 4);
    expect(stack.dimensions.length, box.dimensions.length);
    expect(stack.dimensions.width, box.dimensions.width);
    expect(stack.dimensions.height, box.dimensions.height);
    expect(stack.weights.net, 4*161500);
    expect(stack.weights.gross, box.weights.gross);
    expect(stack.weights.netExplosive, box.weights.netExplosive);

    expect(stack.isBoxCanBeAddedToStack(box), true);
    stack.addBox(box);

    expect(stack.levels.length, 2);
    expect(stack.battleAirAssetCapacities.current, 8);
    expect(stack.dimensions.length, box.dimensions.length);
    expect(stack.dimensions.width, box.dimensions.width);
    expect(stack.dimensions.height, 2*box.dimensions.height);
    expect(stack.weights.net, stack.weights.maxNet);
    expect(stack.weights.gross, stack.weights.maxGross);
    expect(stack.weights.netExplosive, stack.weights.maxNetExplosion);
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
    expect(stack.weights.net, stack.weights.maxNet);
    expect(stack.weights.gross, stack.weights.maxGross);
    expect(stack.weights.netExplosive, stack.weights.maxNetExplosion);
  });
}
