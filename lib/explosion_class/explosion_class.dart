import 'package:tobaa/enumerators/compatibility_group_type.dart';

import 'compatibility_group.dart';
import 'explosion_subclass.dart';

class ExplosionClass implements Comparable {
  static const int COMPARABLE_VALUE_IS_EQUAL = 1;
  static const int COMPARABLE_VALUE_IS_NOT_EQUAL = 0;
  static const double ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_ONE_A = 6.25;
  static const double ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_ONE = 1000000.0;
  static const double ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_TWO = 3000000.0;
  static const double ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_TREE = 5000000.0;
  static const double ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FOUR_S = -1.0;
  static const double ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FOUR = 15000000.0;
  static const double ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FIVE = 5000000.0;
  static const double ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_SIX = 5000000.0;

  late CompatibilityGroup compatibilityGroup;
  late ExplosionSubclass explosionSubclass;

  ExplosionClass({
    required this.compatibilityGroup,
    required this.explosionSubclass
  });

  @override
  /// Return - 0 - not equal
  /// Return - 1 - equal
  int compareTo(other) {
    ExplosionClass o = other;
    var compareCG = this.compatibilityGroup.compareTo(o.compatibilityGroup);
    var isCompatibilityGroupEqual = compareCG ==
        CompatibilityGroup.COMPARABLE_VALUE_IS_EQUAL;

    var compareES = this.explosionSubclass.compareTo(o.explosionSubclass);
    var isExplosionSubclassEqual = compareES ==
        ExplosionSubclass.COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL;

    if (isCompatibilityGroupEqual && isExplosionSubclassEqual)
      return COMPARABLE_VALUE_IS_EQUAL;

    return COMPARABLE_VALUE_IS_NOT_EQUAL;
  }

  get weightLimit {
    Map<double, double> values = {
      ExplosionSubclass.FIRST_SUBCLASS: this._onePointOne(),
      ExplosionSubclass.SECOND_SUBCLASS: ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_TWO,
      ExplosionSubclass.THIRD_SUBCLASS: ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_TREE,
      ExplosionSubclass.FOURTH_SUBCLASS: this._onePointFour(),
      ExplosionSubclass.FIFTH_SUBCLASS: ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FIVE,
      ExplosionSubclass.SIXTH_SUBCLASS: ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_SIX
    };
    return values[this.explosionSubclass.id];
  }

  double _onePointOne() {
    if (this.explosionSubclass.id == ExplosionSubclass.FIRST_SUBCLASS &&
        this.compatibilityGroup.group == CompatibilityGroupType.A)
      return ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_ONE_A;
    else if (this.explosionSubclass.id == ExplosionSubclass.FIRST_SUBCLASS &&
        this.compatibilityGroup.group != CompatibilityGroupType.A)
      return ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_ONE;
    return 0;
  }


  double _onePointFour() {
    if (this.explosionSubclass.id == ExplosionSubclass.FOURTH_SUBCLASS &&
        this.compatibilityGroup.group == CompatibilityGroupType.S)
      return ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FOUR_S;
    else if (this.explosionSubclass.id == ExplosionSubclass.FOURTH_SUBCLASS &&
        this.compatibilityGroup.group != CompatibilityGroupType.S)
      return ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FOUR;
    return 0;
  }

  String _convertCompatibilityGroup(CompatibilityGroupType compatibilityGroupType){
    switch(compatibilityGroupType){
      case CompatibilityGroupType.A:
        return "A";
      case CompatibilityGroupType.B:
        return "B";
      case CompatibilityGroupType.C:
        return "C";
      case CompatibilityGroupType.D:
        return "D";
      case CompatibilityGroupType.E:
        return "E";
      case CompatibilityGroupType.F:
        return "F";
      case CompatibilityGroupType.G:
        return "G";
      case CompatibilityGroupType.H:
        return "H";
      case CompatibilityGroupType.J:
        return "J";
      case CompatibilityGroupType.K:
        return "K";
      case CompatibilityGroupType.L:
        return "L";
      case CompatibilityGroupType.N:
        return "N";
      case CompatibilityGroupType.S:
        return "S";
      case CompatibilityGroupType.None:
        return "None";
    }
  }
  @override
  String toString() {
    return '${this.explosionSubclass.id} ${this._convertCompatibilityGroup(this.compatibilityGroup.group)}';
  }
}
