import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/database/library.dart';
import 'package:tobaa/models/library.dart';

void main() {
  test("compare to", () {
    ExplosionSubclass es11 = DatabaseExplosionSubclasses.container[ExplosionSubclass.FIRST_SUBCLASS]!;
    ExplosionSubclass es12 = DatabaseExplosionSubclasses.container[ExplosionSubclass.SECOND_SUBCLASS]!;
    ExplosionSubclass es13 = DatabaseExplosionSubclasses.container[ExplosionSubclass.THIRD_SUBCLASS]!;
    ExplosionSubclass es14 = DatabaseExplosionSubclasses.container[ExplosionSubclass.FOURTH_SUBCLASS]!;
    ExplosionSubclass es15 = DatabaseExplosionSubclasses.container[ExplosionSubclass.FIFTH_SUBCLASS]!;
    ExplosionSubclass es16 = DatabaseExplosionSubclasses.container[ExplosionSubclass.SIXTH_SUBCLASS]!;

    expect(es11.compareTo(es11), ExplosionSubclass.COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL);
    expect(es11.compareTo(es12), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es11.compareTo(es13), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es11.compareTo(es14), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es11.compareTo(es15), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es11.compareTo(es16), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);

    expect(es15.compareTo(es11), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es15.compareTo(es12), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es15.compareTo(es13), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es15.compareTo(es14), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es15.compareTo(es15), ExplosionSubclass.COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL);
    expect(es15.compareTo(es16), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);

    expect(es12.compareTo(es11), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es12.compareTo(es12), ExplosionSubclass.COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL);
    expect(es12.compareTo(es13), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es12.compareTo(es14), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es12.compareTo(es15), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es12.compareTo(es16), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);

    expect(es13.compareTo(es11), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es13.compareTo(es12), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es13.compareTo(es13), ExplosionSubclass.COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL);
    expect(es13.compareTo(es14), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es13.compareTo(es15), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es13.compareTo(es16), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);

    expect(es16.compareTo(es11), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es16.compareTo(es12), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es16.compareTo(es13), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es16.compareTo(es14), ExplosionSubclass.COMPARABLE_VALUE_HAS_LOWER_PRIORITY);
    expect(es16.compareTo(es15), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es16.compareTo(es16), ExplosionSubclass.COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL);

    expect(es14.compareTo(es11), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es14.compareTo(es12), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es14.compareTo(es13), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es14.compareTo(es14), ExplosionSubclass.COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL);
    expect(es14.compareTo(es15), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
    expect(es14.compareTo(es16), ExplosionSubclass.COMPARABLE_VALUE_HAS_HIGHER_PRIORITY);
  });
}
