import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("increase current - correct value", () {
    LoadingAreaDimensions loadingAreaDimensions = LoadingAreaDimensions();
    loadingAreaDimensions.length = 1;
    loadingAreaDimensions.width = 1;
    loadingAreaDimensions.height = 1;

    Dimensions dimensions = new Dimensions();
    dimensions.length = 1;
    dimensions.width = 1;
    dimensions.height = 1;

    expect(loadingAreaDimensions.isWillBeFit(dimensions), true);

    loadingAreaDimensions.append(dimensions);
    expect(loadingAreaDimensions.occupiedCapacity, 1);
  });

  test("increase current - incorrect value", () {
    LoadingAreaDimensions loadingAreaDimensions = LoadingAreaDimensions();
    loadingAreaDimensions.length = 1;
    loadingAreaDimensions.width = 1;
    loadingAreaDimensions.height = 1;

    Dimensions dimensions = new Dimensions();
    dimensions.length = 2;
    dimensions.width = 1;
    dimensions.height = 1;

    expect(loadingAreaDimensions.isWillBeFit(dimensions), false);
  });

  //    2
  //  1   1
  //2 __|__
  //2 __|__
  test("increase few correct values", () {
    LoadingAreaDimensions loadingAreaDimensions = LoadingAreaDimensions();
    loadingAreaDimensions.length = 4;
    loadingAreaDimensions.width = 2;
    loadingAreaDimensions.height = 1;

    Dimensions dimensions = new Dimensions();
    dimensions.length = 2;
    dimensions.width = 1;
    dimensions.height = 1;

    expect(loadingAreaDimensions.isWillBeFit(dimensions), true);
    loadingAreaDimensions.append(dimensions);
    expect(loadingAreaDimensions.isWillBeFit(dimensions), true);
    loadingAreaDimensions.append(dimensions);
    expect(loadingAreaDimensions.isWillBeFit(dimensions), true);
    loadingAreaDimensions.append(dimensions);
    expect(loadingAreaDimensions.isWillBeFit(dimensions), true);
    loadingAreaDimensions.append(dimensions);
    expect(loadingAreaDimensions.isWillBeFit(dimensions), false);
  });

  //    2
  //  1   1
  //4   |__ 2
  //  __|__ 2
  test("increase few 1 long and 2 short dimensions correct values", () {
    LoadingAreaDimensions loadingAreaDimensions = LoadingAreaDimensions();
    loadingAreaDimensions.length = 4;
    loadingAreaDimensions.width = 2;
    loadingAreaDimensions.height = 1;

    Dimensions shortDimensions = new Dimensions();
    shortDimensions.length = 2;
    shortDimensions.width = 1;
    shortDimensions.height = 1;

    Dimensions longDimensions = new Dimensions();
    longDimensions.length = 4;
    longDimensions.width = 1;
    longDimensions.height = 1;

    expect(loadingAreaDimensions.isWillBeFit(longDimensions), true);
    loadingAreaDimensions.append(longDimensions);
    expect(loadingAreaDimensions.isWillBeFit(shortDimensions), true);
    loadingAreaDimensions.append(shortDimensions);
    expect(loadingAreaDimensions.isWillBeFit(shortDimensions), true);
    loadingAreaDimensions.append(shortDimensions);
    expect(loadingAreaDimensions.isWillBeFit(shortDimensions), false);
  });

  //   8
  //3|3|2
  //------
  //4|4|
  //------
  //2
  //dwie powierzchnie 3x4 zajete
  //skrajne 1 maja powierzchnie 1x4 pusta przestrzeń i dolna 2x4 to też pust
  test("increase few 2 long dimensions correct values", () {
    LoadingAreaDimensions loadingAreaDimensions = LoadingAreaDimensions();
    loadingAreaDimensions.length = 6;
    loadingAreaDimensions.width = 8;
    loadingAreaDimensions.height = 1;

    Dimensions longDimensions = new Dimensions();
    longDimensions.length = 4;
    longDimensions.width = 3;
    longDimensions.height = 1;

    expect(loadingAreaDimensions.isWillBeFit(longDimensions), true);
    loadingAreaDimensions.append(longDimensions);
    expect(loadingAreaDimensions.isWillBeFit(longDimensions), true);
    loadingAreaDimensions.append(longDimensions);
    expect(loadingAreaDimensions.isWillBeFit(longDimensions), false);
  });
}
