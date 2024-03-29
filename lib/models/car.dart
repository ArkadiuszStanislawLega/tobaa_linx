part of models;

class Car {
  late ExplosionClass _explosionClass;
  late Box _boxToAdd;

  late String name;
  late Weights carWeights;
  late LoadingAreaWeights weightOfLoadingArea;
  late LoadingAreaDimensions dimensionOfLoadingArea;
  late List<WarehouseStack> stacks;
  late CarType type;

  Car.empty() {
    this.name = "";
    this.carWeights = new Weights();
    this.weightOfLoadingArea = new LoadingAreaWeights();
    this.dimensionOfLoadingArea = new LoadingAreaDimensions();
    this.stacks = [];
    this.type = CarType.None;
    this.explosionClass = new ExplosionClass.empty();
    this._boxToAdd = new Box.empty();
  }

  Car({
    required this.name,
    required this.carWeights,
    required this.weightOfLoadingArea,
    required this.dimensionOfLoadingArea,
    required this.stacks,
    required this.type,
  }) {
    this._explosionClass = new ExplosionClass(
        compatibilityGroup: CompatibilityGroup(),
        explosionSubclass: ExplosionSubclass());
    this._boxToAdd = new Box.empty();
  }

  ExplosionClass get explosionClass => _explosionClass;

  int get numberOfBoxes {
    int value = 0;
    this.stacks.forEach((stack) {
      value += stack.currentNumberOfBoxes;
    });
    return value;
  }

  int get numberOfBaa {
    int value = 0;
    this.stacks.forEach((stack) {
      value += stack.battleAirAssetCapacities.current;
    });
    return value;
  }

  int get numberOfIncompleteBoxes {
    int value = 0;
    this.stacks.forEach((stack) {
      value += stack.battleAirAssetCapacities.current ==
              stack.battleAirAssetCapacities.maximum
          ? 0
          : 1;
    });
    return value;
  }

  int capacity() {
    int value = 0;
    this.stacks.forEach((element) {
      value += element.battleAirAssetCapacities.current;
    });
    return value;
  }

  void addBoxes(List<Box> boxes) {
    if (boxes.isNotEmpty) {
      boxes.forEach((box) {
        this.addBox(box);
      });
    }
  }

  void addBox(Box box) {
    this._boxToAdd = box;
    bool isBoxAdded = false;
    this._ifCarEmptyAddNewStack();

    if (this.stacks.isNotEmpty) {
      for (int i = 0; i < this.stacks.length; i++) {
        if (this.stacks[i].isBoxCanBeAddedToStack(this._boxToAdd)) {
          this._addBox(i);
          isBoxAdded = true;
          break;
        }
      }
    }

    if (!isBoxAdded && this._isNewStackCanBeAdd()) {
      this._addNewStack();
      this._addBoxToLastStack();
    }
  }

  void _addBox(int stackIndex) {
    this.stacks[stackIndex].addBox(this._boxToAdd);
    this._increaseProperties();
  }

  void _ifCarEmptyAddNewStack() {
    if (this.stacks.isEmpty && this._isNewStackCanBeAdd()) {
      this._addNewStack();
    }
  }

  bool _isNewStackCanBeAdd() {
    WarehouseStack nextStack = this._copyStackFromDB();
    return this.dimensionOfLoadingArea.isWillBeFit(nextStack.dimensions) &&
        this._nextStackDoNotOverweightCar(nextStack);
  }

  bool _nextStackDoNotOverweightCar(WarehouseStack stack) {
    return this._isNetExplosiveWeightNotExceeded(stack.weights.netExplosive) &&
        this._isGrossWeightNotExceeded(stack.weights.gross);
  }

  bool _isGrossWeightNotExceeded(double gross) {
    return gross + this.weightOfLoadingArea.current <=
        this.weightOfLoadingArea.maximum;
  }

  bool _isNetExplosiveWeightNotExceeded(double netExplosive) {
    return netExplosive + this.weightOfLoadingArea.currentNetExplosive <=
        this.weightOfLoadingArea.maximumNetExplosive;
  }

  void _addNewStack() {
    var stack = this._copyStackFromDB();
    this.stacks.add(stack);
    this.dimensionOfLoadingArea.append(stack.dimensions);
  }

  /// Use to check is boxes can be fit in car during wartime.
  bool isBoxesWillFitPeacetime(List<Box> boxes) {
    bool answer = false;
    for (int i = 0; i < boxes.length; i++) {
      answer = this.isBoxWillFitPeacetime(boxes[i]);
    }
    return answer;
  }
  
  bool isBoxWillFitWarTime(Box box){
    this._boxToAdd = box;
    
    var isSizeFit = this._isBoxSizeFit();
    var isWeightFit = this._isGrossWeightNotExceeded(this._boxToAdd.weights.currentGross);
    
    return isSizeFit && isWeightFit;
  }

  /// Sprawdza czy list skrzyń się zmieści
  /// True - jeśli wszystkie ze skrzyń się zmieści, nawet jeśli lista jest pusta.
  /// False - jeśli chociaż jedna ze skrzyń się nie zmieści.
  bool isBoxesWillFitWarTime(List<Box> boxes){
    if (boxes.isNotEmpty) {
      for (int i = 0; i < boxes.length; i++) {
        if (!this.isBoxWillFitWarTime(boxes[i]))
          return false;
      }
    }
    return true;
  }

  bool isBoxWillFitPeacetime(Box box) {
    this._boxToAdd = box;
    var isExplosiveCompatible = this._isBoxExplosiveClassIsCompatible(box);
    var isSizeFit = false;
    var isWeightFit = false;

    if (isExplosiveCompatible) isSizeFit = this._isBoxSizeFit();
    if (isSizeFit) isWeightFit = this._isBoxWeightsFit();

    return isExplosiveCompatible && isSizeFit && isWeightFit;
  }

  bool _isBoxWeightsFit() {
    return _isGrossWeightNotExceeded(this._boxToAdd.weights.currentGross) &&
        _isNetExplosiveWeightNotExceeded(
            this._boxToAdd.weights.currentNetExplosive);
  }

  bool _isBoxSizeFit() {
    var answer = this._isBoxFitIntoAnIncompleteStack(this._boxToAdd);
    if (!answer) {
      answer = this._isNewStackCanBeAdd();
    }
    return answer;
  }

  bool _isBoxFitIntoAnIncompleteStack(Box box) {
    List<Box> boxes = [box];
    for (int i = 0; i < stacks.length; i++) {
      if (!stacks[i].battleAirAssetCapacities.isFull) {
        return stacks[i].isBoxesCanBeAddedToStack(boxes);
      }
    }
    return false;
  }

  bool _isBoxExplosiveClassIsCompatible(Box box) {
    var transportTogether =
        this._isCompatibilityGroupCanBeTransportTogether(box);
    if (transportTogether) {
      if (!this._isNetExplosiveWeightsLimitMustBeReduced(box))
        return transportTogether;
    }

    return transportTogether &&
        this._isNetExplosiveAfterReducedIsFitInLimit(box);
  }

  bool _isCompatibilityGroupCanBeTransportTogether(Box box) {
    if (this._explosionClass.compatibilityGroup.group ==
        CompatibilityGroupType.None) return true;

    var boxCompatibilityGroupType =
        box.battleAirAsset.explosionClass.compatibilityGroup;
    var carCompatibilityGroupType = this.explosionClass.compatibilityGroup;

    var answer =
        carCompatibilityGroupType.canBeStorageWith(boxCompatibilityGroupType);
    //TODO: Dopisać case 3, 4, 5.

    switch (answer) {
      case 1:

        /// Return - 1 - its mean that groups can be storage together.
        return true;
      case 2:

        /// Return - 2 - środki bojowe o grupie B mogą być ładowane do tego samego pojazdu
        /// lub do tego samego konterera razem ze środkami bojowymi grupy D pod warunkiem,
        /// że śa one skutecznie od siebie oddzielone tzn., że wykluczone jest niebezpieczeństwo
        /// przeniesienia wybuchu ze środków grupy zgodności D;
        {
          var isCarCompatibilityGroupB =
              this._explosionClass.compatibilityGroup.group ==
                  CompatibilityGroupType.B;

          var isBoxCompatibilityGroupD =
              box.battleAirAsset.explosionClass.compatibilityGroup.group ==
                  CompatibilityGroupType.D;

          if (isCarCompatibilityGroupB && isBoxCompatibilityGroupD)
            return false;
          else
            return true;
        }
      case 3:

        /// Return - 3 - środki bojowe zaklasyfikowane do 1.6N mogą być przewożone razem jako
        /// środki 1.6N tylko wtedy, jeżeli wykazano na podstawie badań lub przez analogię, że
        /// nie istnieje dodatkowe zagrożenie wybuchem wtórnym pomiędzy tymi środkami.
        /// W przeciwnym przypadku środki te powinny być zaliczone do podklasy 1.1;
        throw new UnimplementedError();
        return false;
      case 4:

        /// Return - 4 -jeżeli środki bojowe grupy zgodności N są przewożone ze środkami
        /// bojowymi grup zgodności C,D lub E, to środki grupy zgodności N powinny być
        /// uważane za środki bojowe posiadające właściwości grupy zgodności D.
        throw new UnimplementedError();
        return true;
      case 5:

        /// Return - 5 - tyczy się opisu "return 4" i "return 3"
        throw new UnimplementedError();
        return false;
      case 6:

        /// Return - 6 - środki bojowe grupy zgodności L mogą być ładowane razem do tego samego
        /// rodzaju, należące do wymienionej grupy zgodności
        var isCarCompatibilityGroupL =
            this._explosionClass.compatibilityGroup.group ==
                CompatibilityGroupType.L;

        var isBoxCompatibilityGroupL =
            box.battleAirAsset.explosionClass.compatibilityGroup.group ==
                CompatibilityGroupType.L;

        if (isCarCompatibilityGroupL && isBoxCompatibilityGroupL) {
          return true;
        }
        return false;

      default:
        return false;
    }
  }

  bool _isNetExplosiveWeightsLimitMustBeReduced(Box box) {
    if (this._explosionClass.compatibilityGroup.group ==
        CompatibilityGroupType.None) return true;
    if (box.battleAirAsset.explosionClass.explosionSubclass.id == 1.4 &&
        box.battleAirAsset.explosionClass.compatibilityGroup.group ==
            CompatibilityGroupType.S) return false;
    return box.battleAirAsset.explosionClass.weightLimit <
        this._explosionClass.weightLimit;
  }

  bool _isNetExplosiveAfterReducedIsFitInLimit(Box box) {
    var netExplosiveReduced = box.battleAirAsset.explosionClass.weightLimit;
    var explosiveCarAndBox = this.weightOfLoadingArea.currentNetExplosive +
        box.weights.currentNetExplosive;
    if (netExplosiveReduced == ExplosionClass.NOT_LIMITED_WEIGHT) return true;
    return explosiveCarAndBox <= netExplosiveReduced;
  }

  /// Is adding new stack and then add boxes to the new stack.
  /// [index] - iterator of list boxes to add
  void _addBoxToLastStack() {
    this.stacks.last.addBox(this._boxToAdd);
    this._increaseProperties();
  }

  WarehouseStack _copyStackFromDB() {
    WarehouseStack copied = DatabaseStacks.container[this._boxToAdd.type]!;
    return WarehouseStack(
      maximumStackLevel: copied.maximumStackLevel,
      battleAirAssetCapacities:
          Capacities(maximum: copied.battleAirAssetCapacities.maximum),
      defaultStackLevel: DatabaseStackLevels.container[this._boxToAdd.type]!,
      weights: StackWeights(
          maxGross: copied.weights.maxGross,
          maxNet: copied.weights.maxNet,
          maxNetExplosion: copied.weights.maxNetExplosion),
      dimensions: StackDimensions(
          length: copied.dimensions.length,
          width: copied.dimensions.width,
          height: copied
              .dimensions.height // maximum stack level * stack level height
          ),
    );
  }

  void _increaseProperties() {
    this
        .weightOfLoadingArea
        .tryIncreaseCurrentWeight(this._boxToAdd.weights.currentGross);
    this.weightOfLoadingArea.tryIncreaseCurrentNetExplosiveWeight(
        this._boxToAdd.weights.currentNetExplosive);
    this.explosionClass = this._boxToAdd.battleAirAsset.explosionClass;
  }

  // Jeżeli środki bojowe należące do różnych podklas klasy 1 załadowane są do
  // tej samej jednostki transportowej z zachowaniem zakazów ładowania razem,
  // to całość ładunku powinna być traktowana tak, jakby należał do
  // najniebezpieczniejszych z tych podklas (według kolejności: 1.1, 1.5, 1.2, 1.3.
  // 1.6, 1.4). Jednakże, przy obliczaniu masy w związku z ograniczeniami
  // przewożonych ilości, nie powinna być brana pod uwagę masa netto środków
  // bojowych grupy zgodności S.
  // Jeżeli środki bojowe sklasyfikowane jako 1.5D przewożone są w tej samej
  // jednostce transportowej ze środkami bojowymi podklasy 1.2, to cały ładunek
  // powinien być traktowany podczas przewozu tak, jakby należał do
  // podklasy 1.1.
  // Całkowitą masę netto (w kg) materiału wybuchowego, która może być
  // przewożona w jednostce transportowej:
  // 1.1A - 6,25
  // 1.1 (inna niż A) - 1000
  // 1.2 - 3000
  // 1.3 - 5000
  // 1.4S - 15000
  // 1.4 (inna niż S) - brak limitu
  // 1.5 - 5000
  // 1.6 - 5000
  set explosionClass(ExplosionClass explosionClass) {
    if (this._isExplosionClassNone()) {
      this._explosionClass = explosionClass;
    } else {
      if (this._isExplosionSubclassHaveHigherPriority(
          explosionClass.explosionSubclass)) {
        this._setCurrentExplosionSubclass(explosionClass);
      }
    }
  }

  bool _isExplosionClassNone() {
    return this._explosionClass.compatibilityGroup.group ==
        CompatibilityGroupType.None;
  }

  bool _isExplosionSubclassHaveHigherPriority(
      ExplosionSubclass explosionSubclass) {
    var comparing =
        this._explosionClass.explosionSubclass.compareTo(explosionSubclass);
    return comparing == ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY;
  }

  void _setCurrentExplosionSubclass(ExplosionClass explosionClass) {
    //TODO: Sprawdzić i poprawić.
    this._explosionClass.explosionSubclass = explosionClass.explosionSubclass;
    this.weightOfLoadingArea.maximumNetExplosive = explosionClass.weightLimit;
  }
}
