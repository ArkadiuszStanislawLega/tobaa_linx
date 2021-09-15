import 'package:tobaa/explosion_class/explosion_class.dart';

class ExplosionSubclass implements Comparable {
  static const double FIRST_SUBCLASS = 1.1;
  static const double SECOND_SUBCLASS = 1.2;
  static const double THIRD_SUBCLASS = 1.3;
  static const double FOURTH_SUBCLASS = 1.4;
  static const double FIFTH_SUBCLASS = 1.5;
  static const double SIXTH_SUBCLASS = 1.6;

  static const int COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL = 1;
  static const int COMPARABLE_VALUE_HAS_HIGHER_PRIORITY = 2;
  static const int COMPARABLE_VALUE_HAS_LOWER_PRIORITY = 3;
  
  late double id;
  late String description;

  ExplosionSubclass({this.id = 0, this.description= ""});


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
  // Zagrożenie stwarzane przez materiały niebezpieczne zaklasyfikowane do
  // odpowiedniej podklasy przedsawiają się następująco:
  // 1.1 > 1.5 > 1.2 > 1.3 > 1.6 > 1.4
  @override

  /// return 1 - equal
  /// return 2 - other is Higher
  /// return 3 - other is lower
  int compareTo(other) {
    //TODO: Make test for this.
    ExplosionSubclass es = other;
    List<int> values = [this._compareOneOne(es),
      this._compareOneFive(es),
      this._compareOneTwo(es),
      this._compareOneTree(es),
      this._compareOneSix(es),
      this._compareOneFour(es)
    ];

    for (int i = 0; i < values.length; i++) {
      if (values[i] > 0)
        return values[i];
    }
    return 0;
  }

  // 1.1 > 1.5 > 1.2 > 1.3 > 1.6 > 1.4
  int _compareOneOne(ExplosionSubclass es) {
    if (this.id == FIRST_SUBCLASS) {
      if (es.id == FIRST_SUBCLASS)
        return COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL;

      if (es.id > FIRST_SUBCLASS)
        return COMPARABLE_VALUE_HAS_LOWER_PRIORITY;
    }
    return 0;
  }

  // ... 1.5 > 1.2 > 1.3 > 1.6 > 1.4
  int _compareOneFive(ExplosionSubclass es)
  {
    if (this.id == FIFTH_SUBCLASS) {
      if (es.id == FIFTH_SUBCLASS)
        return COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL;

      if (es.id == FIRST_SUBCLASS)
        return COMPARABLE_VALUE_HAS_HIGHER_PRIORITY;

      if (es.id > FIRST_SUBCLASS)
        return COMPARABLE_VALUE_HAS_LOWER_PRIORITY;
    }
    return 0;
  }

  // ... 1.2 > 1.3 > 1.6 > 1.4
  int _compareOneTwo(ExplosionSubclass es)
  {
    if (this.id == SECOND_SUBCLASS) {
      if (es.id == SECOND_SUBCLASS)
        return COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL;

      if (es.id == FIRST_SUBCLASS ||
          es.id == FIFTH_SUBCLASS)
        return COMPARABLE_VALUE_HAS_HIGHER_PRIORITY;

      if (es.id > SECOND_SUBCLASS )
        return COMPARABLE_VALUE_HAS_LOWER_PRIORITY;
    }
    return 0;
  }

  // ... 1.3 > 1.6 > 1.4
  int _compareOneTree(ExplosionSubclass es)
  {
    if (this.id == THIRD_SUBCLASS) {
      if (es.id == THIRD_SUBCLASS)
        return COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL;

      if (es.id < THIRD_SUBCLASS ||
          es.id == FIFTH_SUBCLASS)
        return COMPARABLE_VALUE_HAS_HIGHER_PRIORITY;

      if (es.id > THIRD_SUBCLASS)
        return COMPARABLE_VALUE_HAS_LOWER_PRIORITY;
    }
    return 0;
  }

  // ... 1.6 > 1.4
  int _compareOneSix(ExplosionSubclass es)
  {
    if (this.id == SIXTH_SUBCLASS) {
      if (es.id == SIXTH_SUBCLASS)
        return COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL;

      if (es.id == FOURTH_SUBCLASS )
        return COMPARABLE_VALUE_HAS_LOWER_PRIORITY;

      if (es.id < SIXTH_SUBCLASS)
        return COMPARABLE_VALUE_HAS_HIGHER_PRIORITY;
    }
    return 0;
  }

  int _compareOneFour(ExplosionSubclass es)
  {
    if (this.id == FOURTH_SUBCLASS) {
      if (es.id == FOURTH_SUBCLASS)
        return COMPARABLE_VALUE_HAS_THE_SAME_PRIORITY_LEVEL;
      else
        return COMPARABLE_VALUE_HAS_HIGHER_PRIORITY;
    }
    return 0;
  }

}