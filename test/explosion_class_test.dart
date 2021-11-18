import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/models/compatibility_group.dart';
import 'package:tobaa/explosion_class/explosion_class.dart';
import 'package:tobaa/explosion_class/explosion_subclass.dart';

void main() {
  test("Constructor with arguments - returns weight limits", () {
    ExplosionClass explosionClassOnePointOneA = new ExplosionClass(
        explosionSubclass: ExplosionSubclass(id:ExplosionSubclass.FIRST_SUBCLASS),
        compatibilityGroup: CompatibilityGroup(group: CompatibilityGroupType.A)
    );
    ExplosionClass explosionClassOnePointOne = new ExplosionClass(
        explosionSubclass: ExplosionSubclass(id:ExplosionSubclass.FIRST_SUBCLASS),
        compatibilityGroup: CompatibilityGroup(group: CompatibilityGroupType.B)
    );
    ExplosionClass explosionClassOnePointTwo = new ExplosionClass(
        explosionSubclass: ExplosionSubclass(id:ExplosionSubclass.SECOND_SUBCLASS),
        compatibilityGroup: CompatibilityGroup(group: CompatibilityGroupType.A)
    );
    ExplosionClass explosionClassOnePointTree = new ExplosionClass(
        explosionSubclass: ExplosionSubclass(id:ExplosionSubclass.THIRD_SUBCLASS),
        compatibilityGroup: CompatibilityGroup(group: CompatibilityGroupType.A)
    );
    ExplosionClass explosionClassOnePointFourS = new ExplosionClass(
        explosionSubclass: ExplosionSubclass(id:ExplosionSubclass.FOURTH_SUBCLASS),
        compatibilityGroup: CompatibilityGroup(group: CompatibilityGroupType.S)
    );
    ExplosionClass explosionClassOnePointFour = new ExplosionClass(
        explosionSubclass: ExplosionSubclass(id:ExplosionSubclass.FOURTH_SUBCLASS),
        compatibilityGroup: CompatibilityGroup(group: CompatibilityGroupType.A)
    );
    ExplosionClass explosionClassOnePointFive = new ExplosionClass(
        explosionSubclass: ExplosionSubclass(id:ExplosionSubclass.FIFTH_SUBCLASS),
        compatibilityGroup: CompatibilityGroup(group: CompatibilityGroupType.A)
    );
    ExplosionClass explosionClassOnePointSix = new ExplosionClass(
        explosionSubclass: ExplosionSubclass(id:ExplosionSubclass.SIXTH_SUBCLASS),
        compatibilityGroup: CompatibilityGroup(group: CompatibilityGroupType.A)
    );


    expect(explosionClassOnePointOneA.weightLimit,
        ExplosionClass.ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_ONE_A);
    expect(explosionClassOnePointOne.weightLimit,
        ExplosionClass.ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_ONE);
    expect(explosionClassOnePointTwo.weightLimit,
        ExplosionClass.ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_TWO);
    expect(explosionClassOnePointTree.weightLimit,
        ExplosionClass.ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_TREE);
    expect(explosionClassOnePointFourS.weightLimit,
        ExplosionClass.ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FOUR_S);
    expect(explosionClassOnePointFour.weightLimit,
        ExplosionClass.ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FOUR);
    expect(explosionClassOnePointFive.weightLimit,
        ExplosionClass.ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_FIVE);
    expect(explosionClassOnePointSix.weightLimit,
        ExplosionClass.ACCEPTABLE_WEIGHT_LIMIT_ONE_POINT_SIX);

    expect(explosionClassOnePointSix.compareTo(explosionClassOnePointOne), 0);
    expect(explosionClassOnePointOneA.compareTo(explosionClassOnePointOneA), 1);
  });
}