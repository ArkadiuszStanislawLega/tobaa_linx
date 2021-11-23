import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("try increase current value", () {
    StackDimensions stackDimensions = new StackDimensions();
    stackDimensions.width = 4;
    stackDimensions.length = 3;
    stackDimensions.height = 1;

    Dimensions dimensions = new Dimensions();
    dimensions.width = 2;
    dimensions.length = 1;
    dimensions.height = 1;

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied, 2);

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied, 4);

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied, 6);

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied, 8);

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied, 10);

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied, 12);

    expect(stackDimensions.isWillBeFit(dimensions), false);
  });

  test("try increase oversize value", () {
    StackDimensions stackDimensions = new StackDimensions();
    stackDimensions.width = 4;
    stackDimensions.length = 3;
    stackDimensions.height = 1;

    Dimensions dimensions = new Dimensions();
    dimensions.width = 5;
    dimensions.length = 1;
    dimensions.height = 1;
    expect(stackDimensions.isWillBeFit(dimensions), false);

    Dimensions dimensions2 = new Dimensions();
    dimensions2.width = 1;
    dimensions2.length = 4;
    dimensions2.height = 1;
    expect(stackDimensions.isWillBeFit(dimensions2), false);
  });
}
