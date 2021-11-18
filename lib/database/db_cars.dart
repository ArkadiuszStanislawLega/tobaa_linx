part of database;


class DatabaseCars {
  static final Map<CarType, Car> container = {
    CarType.euro_cargo: Car(
      weightOfLoadingArea: LoadingAreaWeights(
          maximum: 15990000,
          maximumNetExplosive: 1500000
      ),
      type: CarType.euro_cargo,
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
    ),
    CarType.stralis: Car(
      weightOfLoadingArea: LoadingAreaWeights(
          maximum: 13000000,
          maximumNetExplosive: 1500000
      ),
      type: CarType.stralis,
      carWeights: Weights(
          gross: 6770000,
          net: 677000
      ),
      name: 'IVECO - Stralis',
      stacks: [],
      dimensionOfLoadingArea: LoadingAreaDimensions(
          height: 2200,
          length: 7200,
          width: 2500
      ),
    )
  };
}