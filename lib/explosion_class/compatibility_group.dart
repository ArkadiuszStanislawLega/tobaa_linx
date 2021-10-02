import 'package:tobaa/enumerators/compatibility_group_type.dart';

class CompatibilityGroup implements Comparable{
  static const int COMPARABLE_VALUE_IS_EQUAL = 1;
  static const int COMPARABLE_VALUE_IS_NOT_EQUAL = 0;

  late CompatibilityGroupType group;
  late String description;

  late CompatibilityGroupType _comparedGroup;

  CompatibilityGroup({
    this.group = CompatibilityGroupType.None,
    this.description = ""
  });

  /// Return - 1 - its mean that groups can be storage together.
  ///
  /// Return - 2 - środki bojowe o grupie B mogą być ładowane do tego samego pojazdu
  /// lub do tego samego konterera razem ze środkami bojowymi grupy D pod warunkiem,
  /// że śa one skutecznie od siebie oddzielone tzn., że wykluczone jest niebezpieczeństwo
  /// przeniesienia wybuchu ze środków grupy zgodności D;
  ///
  /// Return - 3 - środki bojowe zaklasyfikowane do 1.6N mogą być przewożone razem jako
  /// środki 1.6N tylko wtedy, jeżeli wykazano na podstawie badań lub przez analogię, że
  /// nie istnieje dodatkowe zagrożenie wybuchem wtórnym pomiędzy tymi środkami.
  /// W przeciwnym przypadku środki te powinny być zaliczone do podklasy 1.1;
  ///
  /// Return - 4 -jeżeli środki bojowe grupy zgodności N są przewożone ze środkami
  /// bojowymi grup zgodności C,D lub E, to środki grupy zgodności N powinny być
  /// uważane za środki bojowe posiadające właściwości grupy zgodności D.
  ///
  /// Return - 5 - tyczy się opisu "return 4" i "return 3"
  /// Return - 6 - środki bojowe grupy zgodności L mogą być ładowane razem do tego samego
  /// rodzaju, należące do wymienionej grupy zgodności
  int _comparing(){
    var answers = [this._comparingNone(), this._comparingA(), this._comparingB(),
      this._comparingC(), this._comparingD(), this._comparingE(),
      this._comparingF(), this._comparingG(), this._comparingH(),
      this._comparingJ(), this._comparingL(), this._comparingN(),
      this._comparingS()];

    for(int i = 0; i < answers.length; i++){
      if(answers[i] > 0)
        return answers[i];
    }
    return 0;
  }

  int _comparingNone() {
    if (this.group == CompatibilityGroupType.None) {
      return 1;
    }
    return 0;
  }

  int _comparingA(){
    if (this.group == CompatibilityGroupType.A){
      if(this._comparedGroup  == CompatibilityGroupType.A)
        return 1;
    }
    return 0;
  }
  int _comparingB(){
    if (this.group == CompatibilityGroupType.B) {
      if (this._comparedGroup == CompatibilityGroupType.B ||
          this._comparedGroup == CompatibilityGroupType.S)
        return 1;
      if (this._comparedGroup == CompatibilityGroupType.D )
        return 2;
    }
    return 0;
  }
  int _comparingC(){
    if (this.group == CompatibilityGroupType.C){
      if(this._comparedGroup  == CompatibilityGroupType.C ||
          this._comparedGroup  == CompatibilityGroupType.D ||
          this._comparedGroup  == CompatibilityGroupType.E ||
          this._comparedGroup  == CompatibilityGroupType.G ||
          this._comparedGroup  == CompatibilityGroupType.S)
        return 1;
      if (this._comparedGroup  == CompatibilityGroupType.N)
        return 5;
    }
    return 0;
  }
  int _comparingD(){
    if (this.group == CompatibilityGroupType.D){
      if(this._comparedGroup  == CompatibilityGroupType.D ||
          this._comparedGroup  == CompatibilityGroupType.C ||
          this._comparedGroup  == CompatibilityGroupType.E ||
          this._comparedGroup  == CompatibilityGroupType.G ||
          this._comparedGroup  == CompatibilityGroupType.S)
        return 1;
      if(this._comparedGroup  == CompatibilityGroupType.B)
        return 2;
      if(this._comparedGroup  == CompatibilityGroupType.N)
        return 5;
    }
    return 0;
  }
  int _comparingE(){
    if (this.group == CompatibilityGroupType.E){
      if(this._comparedGroup  == CompatibilityGroupType.E ||
          this._comparedGroup  == CompatibilityGroupType.C ||
          this._comparedGroup  == CompatibilityGroupType.D ||
          this._comparedGroup  == CompatibilityGroupType.G ||
          this._comparedGroup  == CompatibilityGroupType.S)
        return 1;
      if(this._comparedGroup  == CompatibilityGroupType.N)
        return 5;
    }
    return 0;
  }
  int _comparingF() {
    if (this.group == CompatibilityGroupType.F) {
      if (this._comparedGroup == CompatibilityGroupType.F ||
          this._comparedGroup == CompatibilityGroupType.S)
        return 1;
    }
    return 0;
  }

  int _comparingG(){
    if (this.group == CompatibilityGroupType.G){
      if(this._comparedGroup == CompatibilityGroupType.G ||
          this._comparedGroup == CompatibilityGroupType.C ||
          this._comparedGroup == CompatibilityGroupType.D||
          this._comparedGroup == CompatibilityGroupType.E||
          this._comparedGroup == CompatibilityGroupType.S)
        return 1;
    }
    return 0;
  }
  int _comparingH(){
    if (this.group == CompatibilityGroupType.H){
      if(this._comparedGroup  == CompatibilityGroupType.H ||
          this._comparedGroup  == CompatibilityGroupType.S)
        return 1;
    }
    return 0;
  }

  int _comparingJ(){
    if (this.group == CompatibilityGroupType.J){
      if(this._comparedGroup  == CompatibilityGroupType.J ||
          this._comparedGroup  == CompatibilityGroupType.S)
        return 1;
    }
    return 0;
  }

  int _comparingL(){
    if (this.group == CompatibilityGroupType.L) {
      if (this._comparedGroup == CompatibilityGroupType.L)
        return 6;
    }
    return 0;
  }

  int _comparingN() {
    if (this.group == CompatibilityGroupType.N) {
      if (this._comparedGroup == CompatibilityGroupType.S)
        return 1;
      if (this._comparedGroup == CompatibilityGroupType.N)
        return 3;

      if (this._comparedGroup == CompatibilityGroupType.C ||
          this._comparedGroup == CompatibilityGroupType.D ||
          this._comparedGroup == CompatibilityGroupType.E)
        return 5;
    }
    return 0;
  }

  int _comparingS() {
    if (this.group == CompatibilityGroupType.S) {
      if (this._comparedGroup != CompatibilityGroupType.L &&
          this._comparedGroup != CompatibilityGroupType.A)
        return 1;
    }
    return 0;
  }


  /// If value is higher then 0 it mean that groups can be hold together,
  /// else groups require special consideration
  int canBeStorageWith(CompatibilityGroup other) {
    this._comparedGroup = other.group;
    return this._comparing();
  }

  @override
  int compareTo(other) {
    this._comparedGroup = other.group;
    if(this.group == this._comparedGroup)
      return COMPARABLE_VALUE_IS_EQUAL;

    return COMPARABLE_VALUE_IS_NOT_EQUAL;
  }

  String convertCompatibilityGroup(CompatibilityGroupType compatibilityGroupType){
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
}