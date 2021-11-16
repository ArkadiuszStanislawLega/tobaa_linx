import 'package:tobaa/database/db_boxes.dart';
import 'package:tobaa/enumerators/box_type.dart';

String boxEnumsToNamesConverter(BoxType value) {
      return DatabaseBoxes.container[value]!.name;
}