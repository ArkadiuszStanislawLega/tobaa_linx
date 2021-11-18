import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/models/stack_dimensions.dart';
import 'package:tobaa/models/stack_level.dart';

void main() {
  test("try increase current value", () {
    StackDimensions stackDimensions = new StackDimensions();
    stackDimensions.width = 3;
    stackDimensions.length = 5;
    stackDimensions.height = 1;

    Dimensions dimensions = new Dimensions();
    dimensions.width = 1;
    dimensions.length = 5;
    dimensions.height = 1;

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied.capacity, 5);

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied.capacity, 10);

    expect(stackDimensions.isWillBeFit(dimensions), true);
    stackDimensions.append(dimensions);
    expect(stackDimensions.occupied.capacity, 15);

    expect(stackDimensions.isWillBeFit(dimensions), false);
  });

}