import 'package:flutter_test/flutter_test.dart';
import 'package:tobaa/enumerators/compatibility_group_type.dart';
import 'package:tobaa/models/compatibility_group.dart';

void main() {

  test("comparing None", () {
    CompatibilityGroup group = new CompatibilityGroup(group: CompatibilityGroupType.None);
    CompatibilityGroup limitedGroup = new CompatibilityGroup(group:CompatibilityGroupType.None);
    CompatibilityGroup correctGroup = new CompatibilityGroup(group:CompatibilityGroupType.None);

    expect(group.canBeStorageWith(limitedGroup), 1);
    expect(group.canBeStorageWith(correctGroup), 1);
  });

  test("comparing A", () {
    CompatibilityGroup group = new CompatibilityGroup(group: CompatibilityGroupType.A);
    CompatibilityGroup correctGroup = new CompatibilityGroup(group: CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroup = new CompatibilityGroup(group: CompatibilityGroupType.S);

    expect(group.canBeStorageWith(correctGroup), 1);
    expect(group.canBeStorageWith(uncorrectedGroup), 0);
  });

  test("comparing B", () {
    CompatibilityGroup group = new CompatibilityGroup(group: CompatibilityGroupType.B);
    CompatibilityGroup limitedGroupD = new CompatibilityGroup(group: CompatibilityGroupType.D);

    CompatibilityGroup correctGroupB = new CompatibilityGroup(group: CompatibilityGroupType.B);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group: CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group: CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupC = new CompatibilityGroup(group: CompatibilityGroupType.C);
    CompatibilityGroup uncorrectedGroupE = new CompatibilityGroup(group: CompatibilityGroupType.E);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group: CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupG = new CompatibilityGroup(group: CompatibilityGroupType.G);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group: CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group: CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group: CompatibilityGroupType.L);
    CompatibilityGroup uncorrectedGroupN = new CompatibilityGroup(group: CompatibilityGroupType.N);

    expect(group.canBeStorageWith(limitedGroupD), 2);
    expect(group.canBeStorageWith(limitedGroupD), 2);

    expect(group.canBeStorageWith(correctGroupB), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupC), 0);
    expect(group.canBeStorageWith(uncorrectedGroupE), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupG), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
    expect(group.canBeStorageWith(uncorrectedGroupN), 0);
  });

  test("comparing C", () {
    CompatibilityGroup group = new CompatibilityGroup(group: CompatibilityGroupType.C);
    CompatibilityGroup limitedGroupN = new CompatibilityGroup(group: CompatibilityGroupType.N);

    CompatibilityGroup correctGroupC = new CompatibilityGroup(group: CompatibilityGroupType.C);
    CompatibilityGroup correctGroupD = new CompatibilityGroup(group: CompatibilityGroupType.D);
    CompatibilityGroup correctGroupE = new CompatibilityGroup(group: CompatibilityGroupType.E);
    CompatibilityGroup correctGroupG = new CompatibilityGroup(group: CompatibilityGroupType.G);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group: CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group: CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupB = new CompatibilityGroup(group: CompatibilityGroupType.B);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group: CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group: CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group: CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group: CompatibilityGroupType.L);

    expect(group.canBeStorageWith(limitedGroupN), 5);

    expect(group.canBeStorageWith(correctGroupC), 1);
    expect(group.canBeStorageWith(correctGroupD), 1);
    expect(group.canBeStorageWith(correctGroupE), 1);
    expect(group.canBeStorageWith(correctGroupG), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupB), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
  });

  test("comparing D", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup limitedGroupB = new CompatibilityGroup(group:CompatibilityGroupType.B);
    CompatibilityGroup limitedGroupN = new CompatibilityGroup(group:CompatibilityGroupType.N);

    CompatibilityGroup correctGroupC = new CompatibilityGroup(group:CompatibilityGroupType.C);
    CompatibilityGroup correctGroupD = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup correctGroupE = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup correctGroupG = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group:CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group:CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group:CompatibilityGroupType.L);

    expect(group.canBeStorageWith(limitedGroupB), 2);
    expect(group.canBeStorageWith(limitedGroupN), 5);

    expect(group.canBeStorageWith(correctGroupC), 1);
    expect(group.canBeStorageWith(correctGroupD), 1);
    expect(group.canBeStorageWith(correctGroupE), 1);
    expect(group.canBeStorageWith(correctGroupG), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
  });

  test("comparing E", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup limitedGroupN = new CompatibilityGroup(group:CompatibilityGroupType.N);

    CompatibilityGroup correctGroupC = new CompatibilityGroup(group:CompatibilityGroupType.C);
    CompatibilityGroup correctGroupD = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup correctGroupE = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup correctGroupG = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group:CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group:CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupB = new CompatibilityGroup(group:CompatibilityGroupType.B);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group:CompatibilityGroupType.L);

    expect(group.canBeStorageWith(limitedGroupN), 5);

    expect(group.canBeStorageWith(correctGroupC), 1);
    expect(group.canBeStorageWith(correctGroupD), 1);
    expect(group.canBeStorageWith(correctGroupE), 1);
    expect(group.canBeStorageWith(correctGroupG), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupB), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
  });

  test("comparing F", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup correctGroupF = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group:CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group:CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupB = new CompatibilityGroup(group:CompatibilityGroupType.B);
    CompatibilityGroup uncorrectedGroupC = new CompatibilityGroup(group:CompatibilityGroupType.C);
    CompatibilityGroup uncorrectedGroupD = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup uncorrectedGroupE = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup uncorrectedGroupG = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group:CompatibilityGroupType.L);
    CompatibilityGroup uncorrectedGroupN = new CompatibilityGroup(group:CompatibilityGroupType.N);

    expect(group.canBeStorageWith(correctGroupF), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupB), 0);
    expect(group.canBeStorageWith(uncorrectedGroupC), 0);
    expect(group.canBeStorageWith(uncorrectedGroupD), 0);
    expect(group.canBeStorageWith(uncorrectedGroupE), 0);
    expect(group.canBeStorageWith(uncorrectedGroupG), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
    expect(group.canBeStorageWith(uncorrectedGroupN), 0);
  });

  test("comparing G", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup correctGroupC = new CompatibilityGroup(group:CompatibilityGroupType.C);
    CompatibilityGroup correctGroupD = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup correctGroupE = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup correctGroupG = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group:CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group:CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupB = new CompatibilityGroup(group:CompatibilityGroupType.B);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group:CompatibilityGroupType.L);
    CompatibilityGroup uncorrectedGroupN = new CompatibilityGroup(group:CompatibilityGroupType.N);

    expect(group.canBeStorageWith(correctGroupC), 1);
    expect(group.canBeStorageWith(correctGroupD), 1);
    expect(group.canBeStorageWith(correctGroupE), 1);
    expect(group.canBeStorageWith(correctGroupG), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupB), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
    expect(group.canBeStorageWith(uncorrectedGroupN), 0);
  });

  test("comparing H", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup correctGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group:CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group: CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupB = new CompatibilityGroup(group: CompatibilityGroupType.B);
    CompatibilityGroup uncorrectedGroupC = new CompatibilityGroup(group: CompatibilityGroupType.C);
    CompatibilityGroup uncorrectedGroupD = new CompatibilityGroup(group: CompatibilityGroupType.D);
    CompatibilityGroup uncorrectedGroupE = new CompatibilityGroup(group: CompatibilityGroupType.E);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group: CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupG = new CompatibilityGroup(group: CompatibilityGroupType.G);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group: CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group: CompatibilityGroupType.L);
    CompatibilityGroup uncorrectedGroupN = new CompatibilityGroup(group: CompatibilityGroupType.N);

    expect(group.canBeStorageWith(correctGroupH), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupB), 0);
    expect(group.canBeStorageWith(uncorrectedGroupC), 0);
    expect(group.canBeStorageWith(uncorrectedGroupD), 0);
    expect(group.canBeStorageWith(uncorrectedGroupE), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupG), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
    expect(group.canBeStorageWith(uncorrectedGroupN), 0);
  });

  test("comparing J", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup correctGroupJ = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group:CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group:CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupB = new CompatibilityGroup(group:CompatibilityGroupType.B);
    CompatibilityGroup uncorrectedGroupC = new CompatibilityGroup(group:CompatibilityGroupType.C);
    CompatibilityGroup uncorrectedGroupD = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup uncorrectedGroupE = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupG = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group:CompatibilityGroupType.L);
    CompatibilityGroup uncorrectedGroupN = new CompatibilityGroup(group:CompatibilityGroupType.N);

    expect(group.canBeStorageWith(correctGroupJ), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupB), 0);
    expect(group.canBeStorageWith(uncorrectedGroupC), 0);
    expect(group.canBeStorageWith(uncorrectedGroupD), 0);
    expect(group.canBeStorageWith(uncorrectedGroupE), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupG), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
    expect(group.canBeStorageWith(uncorrectedGroupN), 0);
  });

  test("comparing L", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.L);
    CompatibilityGroup limitedGroupL = new CompatibilityGroup(group:CompatibilityGroupType.L);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group:CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupB = new CompatibilityGroup(group:CompatibilityGroupType.B);
    CompatibilityGroup uncorrectedGroupC = new CompatibilityGroup(group:CompatibilityGroupType.C);
    CompatibilityGroup uncorrectedGroupD = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup uncorrectedGroupE = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupG = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupN = new CompatibilityGroup(group:CompatibilityGroupType.N);

    expect(group.canBeStorageWith(limitedGroupL), 6);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupB), 0);
    expect(group.canBeStorageWith(uncorrectedGroupC), 0);
    expect(group.canBeStorageWith(uncorrectedGroupD), 0);
    expect(group.canBeStorageWith(uncorrectedGroupE), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupG), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupN), 0);
  });

  test("comparing N", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.N);
    CompatibilityGroup limitedGroupC = new CompatibilityGroup(group:CompatibilityGroupType.C);
    CompatibilityGroup limitedGroupD = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup limitedGroupE = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup limitedGroupN = new CompatibilityGroup(group:CompatibilityGroupType.N);

    CompatibilityGroup correctGroupS = new CompatibilityGroup(group:CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group:CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupB = new CompatibilityGroup(group:CompatibilityGroupType.B);
    CompatibilityGroup uncorrectedGroupF = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup uncorrectedGroupG = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup uncorrectedGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup uncorrectedGroupJ = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group:CompatibilityGroupType.L);

    expect(group.canBeStorageWith(limitedGroupC), 5);
    expect(group.canBeStorageWith(limitedGroupD), 5);
    expect(group.canBeStorageWith(limitedGroupE), 5);
    expect(group.canBeStorageWith(limitedGroupN), 3);

    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupB), 0);
    expect(group.canBeStorageWith(uncorrectedGroupF), 0);
    expect(group.canBeStorageWith(uncorrectedGroupH), 0);
    expect(group.canBeStorageWith(uncorrectedGroupG), 0);
    expect(group.canBeStorageWith(uncorrectedGroupJ), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
  });

  test("comparing S", () {
    CompatibilityGroup group = new CompatibilityGroup(group:CompatibilityGroupType.S);
    CompatibilityGroup correctGroupB = new CompatibilityGroup(group:CompatibilityGroupType.B);
    CompatibilityGroup correctGroupC = new CompatibilityGroup(group:CompatibilityGroupType.C);
    CompatibilityGroup correctGroupD = new CompatibilityGroup(group:CompatibilityGroupType.D);
    CompatibilityGroup correctGroupE = new CompatibilityGroup(group:CompatibilityGroupType.E);
    CompatibilityGroup correctGroupF = new CompatibilityGroup(group:CompatibilityGroupType.F);
    CompatibilityGroup correctGroupG = new CompatibilityGroup(group:CompatibilityGroupType.G);
    CompatibilityGroup correctGroupH = new CompatibilityGroup(group:CompatibilityGroupType.H);
    CompatibilityGroup correctGroupJ = new CompatibilityGroup(group:CompatibilityGroupType.J);
    CompatibilityGroup correctGroupN = new CompatibilityGroup(group:CompatibilityGroupType.N);
    CompatibilityGroup correctGroupS = new CompatibilityGroup(group:CompatibilityGroupType.S);

    CompatibilityGroup uncorrectedGroupA = new CompatibilityGroup(group:CompatibilityGroupType.A);
    CompatibilityGroup uncorrectedGroupL = new CompatibilityGroup(group:CompatibilityGroupType.L);

    expect(group.canBeStorageWith(correctGroupB), 1);
    expect(group.canBeStorageWith(correctGroupC), 1);
    expect(group.canBeStorageWith(correctGroupD), 1);
    expect(group.canBeStorageWith(correctGroupE), 1);
    expect(group.canBeStorageWith(correctGroupF), 1);
    expect(group.canBeStorageWith(correctGroupG), 1);
    expect(group.canBeStorageWith(correctGroupH), 1);
    expect(group.canBeStorageWith(correctGroupJ), 1);
    expect(group.canBeStorageWith(correctGroupN), 1);
    expect(group.canBeStorageWith(correctGroupS), 1);

    expect(group.canBeStorageWith(uncorrectedGroupA), 0);
    expect(group.canBeStorageWith(uncorrectedGroupL), 0);
  });
}