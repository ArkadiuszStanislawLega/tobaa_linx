import 'package:tobaa/car/car.dart';
import 'package:tobaa/dimensions/loading_area_dimensions.dart';
import 'package:tobaa/enumerators/car_type.dart';
import 'package:tobaa/weights/loading_area_weights.dart';
import 'package:tobaa/weights/weights.dart';

class DatabaseCars {
  static final Map<CarType, Car> container = {
    CarType.test: Car(
      weightOfLoadingArea: LoadingAreaWeights(
          maximum: 200000,
          maximumNetExplosive: 200000
      ),
      type: CarType.test,
      carWeights: Weights(
          gross: 1,
          net: 1
      ),
      name: 'Test car',
      stacks: [],
      dimensionOfLoadingArea: LoadingAreaDimensions(
          height: 10,
          length: 100,
          width: 50
      ),
    ),

    CarType.smallCarTest: Car(
      weightOfLoadingArea: LoadingAreaWeights(
          maximum: 6.0,
          maximumNetExplosive: 1.5
      ),
      type: CarType.smallCarTest,
      carWeights: Weights(
          gross: 1,
          net: 1
      ),
      name: 'Small car test',
      stacks: [],
      dimensionOfLoadingArea: LoadingAreaDimensions(
          height: 6,
          length: 5,
          width: 6
      ),
    ),

    CarType.euro_cargo: Car(
      weightOfLoadingArea: LoadingAreaWeights(
          maximum: 15990000,
          maximumNetExplosive: 1500000
      ),
      type: CarType.smallCarTest,
      carWeights: Weights(
          gross: 6770000,
          net: 677000
      ),
      name: 'IVECO - EUROCARGO',
      stacks: [],
      dimensionOfLoadingArea: LoadingAreaDimensions(
          height: 1807,
          length: 6054,
          width: 2470
      ),
    )
  };
}