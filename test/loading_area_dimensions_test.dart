import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/dimensions/dimensions.dart';
import 'package:tobaa/dimensions/loading_area_dimensions.dart';

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
    expect(loadingAreaDimensions.occupied.capacity, 1);
  });

  test("CNU431", () {
    int euroCargoHeight = 1870;
    int euroCargoLength = 6054;
    int euroCargoWidth = 2470;

    int cnu431Height = 480;
    int cnu431Width = 968;
    int cnu431Length = 4416;
    int capacityOneCNU431 = cnu431Length*cnu431Width*cnu431Height;

    Dimensions cnu431Dimension = new Dimensions(
        height: cnu431Height, width: cnu431Width, length: cnu431Length);

    LoadingAreaDimensions lad = LoadingAreaDimensions(
        height: euroCargoHeight,
        length: euroCargoLength,
        width: euroCargoWidth);

    expect(lad.isWillBeFit(cnu431Dimension), true);
    lad.append(cnu431Dimension);

    expect(lad.occupied.capacity, capacityOneCNU431);

    expect(lad.isWillBeFit(cnu431Dimension), true);
    lad.append(cnu431Dimension);

    expect(lad.occupied.capacity, 2*capacityOneCNU431);

    expect(lad.isWillBeFit(cnu431Dimension), false);
    lad.append(cnu431Dimension);

    expect(lad.occupied.capacity, 2*capacityOneCNU431);
  });
}
