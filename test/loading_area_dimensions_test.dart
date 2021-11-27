import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("increase current - correct value", () {
    LoadingAreaDimensions loadingAreaDimensions =
        LoadingAreaDimensions(width: 10, length: 10, height: 10);

    Dimensions dimensions = Dimensions(width: 10, length: 10, height: 10);

    expect(loadingAreaDimensions.isWillBeFit(dimensions), true);

    loadingAreaDimensions.append(dimensions);
    expect(loadingAreaDimensions.occupiedCapacity, 1000);
  });

  test("increase current - incorrect value", () {
    LoadingAreaDimensions loadingAreaDimensions =
        LoadingAreaDimensions(width: 10, length: 10, height: 10);

    Dimensions dimensions = Dimensions(width: 10, length: 20, height: 10);
    expect(loadingAreaDimensions.isWillBeFit(dimensions), false);
  });

  //    2
  //  1   1
  //2 __|__
  //2 __|__
  test("increase few correct values", () {
    LoadingAreaDimensions loadingAreaDimensions =
        LoadingAreaDimensions(width: 24, length: 44, height: 10);

    List<Dimensions> dimensionsList = [
      Dimensions(width: 10, length: 20, height: 10),
      Dimensions(width: 10, length: 20, height: 10),
      Dimensions(width: 10, length: 20, height: 10),
      Dimensions(width: 10, length: 20, height: 10),
      Dimensions(width: 10, length: 20, height: 10),
    ];
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[0]), true);
    loadingAreaDimensions.append(dimensionsList[0]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[1]), true);
    loadingAreaDimensions.append(dimensionsList[1]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[2]), true);
    loadingAreaDimensions.append(dimensionsList[2]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[3]), true);
    loadingAreaDimensions.append(dimensionsList[3]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[4]), false);
  });

  //    2
  //  1   1
  //4   |__ 2
  //  __|__ 2
  test("increase few 1 long and 2 short dimensions correct values", () {
    LoadingAreaDimensions loadingAreaDimensions =
        LoadingAreaDimensions(width: 24, length: 44, height: 10);

    List<Dimensions> dimensionsList = [
      Dimensions(width: 10, length: 40, height: 10),
      Dimensions(width: 10, length: 20, height: 10),
      Dimensions(width: 10, length: 20, height: 10),
      Dimensions(width: 10, length: 20, height: 10),
    ];

    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[0]), true);
    loadingAreaDimensions.append(dimensionsList[0]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[1]), true);
    loadingAreaDimensions.append(dimensionsList[1]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[2]), true);
    loadingAreaDimensions.append(dimensionsList[2]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[3]), false);
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
    LoadingAreaDimensions loadingAreaDimensions =
        LoadingAreaDimensions(width: 83, length: 80, height: 10);

    List<Dimensions> dimensionsList = [
      Dimensions(width: 30, length: 40, height: 10),
      Dimensions(width: 30, length: 40, height: 10),
      Dimensions(width: 30, length: 40, height: 10),
    ];

    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[0]), true);
    loadingAreaDimensions.append(dimensionsList[0]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[1]), true);
    loadingAreaDimensions.append(dimensionsList[1]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[2]), false);
  });

  test("is occupied test they intersect", () {
    LoadingAreaDimensions loadingAreaDimensions =
    LoadingAreaDimensions(width: 80, length: 60, height: 10);

    List<Coordinates> first = [
      Coordinates(x: 1, y: 12, z: 0),
      Coordinates(x: 11, y: 12, z: 0),
      Coordinates(x: 1, y: 41, z: 0),
      Coordinates(x: 11, y: 41, z: 0),
    ];

    loadingAreaDimensions.append( Dimensions(width: 30, length: 40, height: 10));
    expect(loadingAreaDimensions.isOccupied(first), true);
  });

  test("is occupied test they do not intersect", () {
    LoadingAreaDimensions loadingAreaDimensions =
    LoadingAreaDimensions(width: 80, length: 60, height: 10);

    List<Coordinates> first = [
      Coordinates(x: 2, y: 13, z: 0),
      Coordinates(x: 12, y: 13, z: 0),
      Coordinates(x: 2, y: 42, z: 0),
      Coordinates(x: 12, y: 42, z: 0),
    ];

    loadingAreaDimensions.append( Dimensions(width: 30, length: 40, height: 10));
    expect(loadingAreaDimensions.isOccupied(first), false);
  });
}
