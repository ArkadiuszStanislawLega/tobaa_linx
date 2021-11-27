import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("increase current - correct value", () {
    LoadingAreaDimensions loadingAreaDimensions =
        LoadingAreaDimensions(width: 1, length: 1, height: 1);

    Dimensions dimensions = Dimensions(width: 1, length: 1, height: 1);

    expect(loadingAreaDimensions.isWillBeFit(dimensions), true);

    loadingAreaDimensions.append(dimensions);
    expect(loadingAreaDimensions.occupiedCapacity, 1);
  });

  test("increase current - incorrect value", () {
    LoadingAreaDimensions loadingAreaDimensions =
        LoadingAreaDimensions(width: 1, length: 1, height: 1);

    Dimensions dimensions = Dimensions(width: 1, length: 2, height: 1);
    expect(loadingAreaDimensions.isWillBeFit(dimensions), false);
  });

  //    2
  //  1   1
  //2 __|__
  //2 __|__
  test("increase few correct values", () {
    LoadingAreaDimensions loadingAreaDimensions =
        LoadingAreaDimensions(width: 4, length: 2, height: 1);

    List<Dimensions> dimensionsList = [
      Dimensions(width: 1, length: 2, height: 1),
      Dimensions(width: 1, length: 2, height: 1),
      Dimensions(width: 1, length: 2, height: 1),
      Dimensions(width: 1, length: 2, height: 1),
      Dimensions(width: 1, length: 2, height: 1),
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
        LoadingAreaDimensions(width: 4, length: 2, height: 1);

    List<Dimensions> dimensionsList = [
      Dimensions(width: 1, length: 4, height: 1),
      Dimensions(width: 1, length: 2, height: 1),
      Dimensions(width: 1, length: 2, height: 1),
      Dimensions(width: 1, length: 2, height: 1),
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
        LoadingAreaDimensions(width: 8, length: 6, height: 1);

    List<Dimensions> dimensionsList = [
      Dimensions(width: 3, length: 4, height: 1),
      Dimensions(width: 3, length: 4, height: 1),
      Dimensions(width: 3, length: 4, height: 1),
    ];

    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[0]), true);
    loadingAreaDimensions.append(dimensionsList[0]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[1]), true);
    loadingAreaDimensions.append(dimensionsList[1]);
    expect(loadingAreaDimensions.isWillBeFit(dimensionsList[2]), false);
  });
}
