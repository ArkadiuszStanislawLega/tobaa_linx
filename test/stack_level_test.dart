import 'package:flutter_test/flutter_test.dart';

import 'package:tobaa/database/library.dart';
import 'package:tobaa/enumerators/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("Append JASSM box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.CNU614]!;
    Box box = DatabaseBoxes.container[BoxType.CNU614]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    stackLevel.appendBox(box);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
  });

  test("Append JSOW box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.CNU672]!;
    Box box = DatabaseBoxes.container[BoxType.CNU672]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    stackLevel.appendBox(box);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
  });

  test("Append MAVERIC box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.CNU445]!;
    Box box = DatabaseBoxes.container[BoxType.CNU445]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    stackLevel.appendBox(box);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
  });

  test("Append AIM120 box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.CNU431]!;
    Box box = DatabaseBoxes.container[BoxType.CNU431]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    stackLevel.appendBox(box);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
  });

  test("Append 9X box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.CNU609]!;
    Box box = DatabaseBoxes.container[BoxType.CNU609]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    stackLevel.appendBox(box);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
  });

  test("Append TPRRR box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.M548_TPRRR]!;
    Box box = DatabaseBoxes.container[BoxType.M548_TPRRR]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    for (int i = 0; i < 9; i++) stackLevel.appendBox(box);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
  });


  test("Append MPLD box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.M548MPLD]!;
    Box box = DatabaseBoxes.container[BoxType.M548MPLD]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    for (int i = 0; i < 9; i++) stackLevel.appendBox(box);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
  });

  test("Append MK84 box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.MK79]!;
    Box box = DatabaseBoxes.container[BoxType.MK79]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);

    stackLevel.appendBox(box);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.netExplosive);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
  });

  test("Append MK82 box to stack level.", () {
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.MHU149]!;
    Box box = DatabaseBoxes.container[BoxType.MHU149]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);

    stackLevel.appendBox(box);
    expect(stackLevel.capacities.current, stackLevel.capacities.maximum);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
    expect(stackLevel.weights.gross, stackLevel.weights.gross);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.netExplosive);
  });

  test("Append MJU7A/B box to stack level.", () {
    const int MAX_NUMBER_OF_BOXES_IN_STACK = 18;
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.MJU7ABOX]!;
    Box box = DatabaseBoxes.container[BoxType.MJU7ABOX]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    for (int i = 0; i < MAX_NUMBER_OF_BOXES_IN_STACK; i++) {
      if (stackLevel.isBoxWillBeFit(box)) stackLevel.appendBox(box);
    }

    expect(stackLevel.capacities.current, stackLevel.capacities.maximum);
    expect(stackLevel.dimensions.width, 1287);
    expect(stackLevel.dimensions.length, 958);
    expect(stackLevel.dimensions.height, 1038);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
  });

  test("Append RR170A/AL box to stack level.", () {
    const int MAX_NUMBER_OF_BOXES_IN_STACK = 6;
    StackLevel stackLevel = DatabaseStackLevels.container[BoxType.RR170AL_BOX]!;
    Box box = DatabaseBoxes.container[BoxType.RR170AL_BOX]!;

    box.fillBox(box.capacities.maximum);
    expect(stackLevel.isBoxWillBeFit(box), true);
    for (int i = 0; i < MAX_NUMBER_OF_BOXES_IN_STACK; i++) {
      if (stackLevel.isBoxWillBeFit(box)) stackLevel.appendBox(box);
    }

    expect(stackLevel.capacities.current, stackLevel.capacities.maximum);
    expect(stackLevel.dimensions.width, 1245);
    expect(stackLevel.dimensions.length, 705);
    expect(stackLevel.dimensions.height, 265);
    expect(stackLevel.weights.gross, stackLevel.weights.maxGross);
    expect(stackLevel.weights.netExplosive, stackLevel.weights.maxNetExplosion);
    expect(stackLevel.weights.net, stackLevel.weights.maxNet);
  });
}
