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

    loadingAreaDimensions.isWillBeFit(dimensions);
    expect(loadingAreaDimensions.isWillBeFit(dimensions), true);

    loadingAreaDimensions.append(dimensions);
    expect(loadingAreaDimensions.occupied.capacity, 1);
  });
}
