part of converters;

String boxEnumsToNamesConverter(BoxType value) {
      return DatabaseBoxes.container[value]!.name;
}