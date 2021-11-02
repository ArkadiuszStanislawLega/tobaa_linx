import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobaa/widgets/Constants/app_colors.dart';
import 'package:tobaa/database/db_assets.dart';
import 'package:tobaa/enumerators/baa_type.dart';
import 'package:tobaa/stack/stack_level.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/widgets/Constants/url.dart';
import 'package:tobaa/widgets/ListItems/stack_level_list_item.dart';
import 'package:tobaa/widgets/ListViews/stack_levels_list_view.dart';
import 'package:tobaa/widgets/SmallWidgets/property_view.dart';
import 'package:tobaa/widgets/SmallWidgets/property_with_hint_view.dart';

import '../../main.dart';
import '../Constants/strings.dart';

class StackDetailView extends  StatelessWidget {

  final ContainerStack.Stack _stack;

  StackDetailView(this._stack);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this._stack.levels.isNotEmpty &&
            this._stack.levels.first.boxes.isNotEmpty ?
        Text('${Strings.STACK} ${this._stack.levels.first.boxes.first.name}') :
        Text('${Strings.STACKS_LEVEL} ${this._stack.levels.length}'),
      ),
      body: Container(
          color: Color(AppColors.STACK),
          child: new SingleChildScrollView(
              child: Column(
                children: [
                  PropertyView(Strings.WIDTH,
                      '${sizeConverter(this._stack.dimensions.width)}'
                  ),
                  PropertyView(Strings.LENGTH,
                      '${sizeConverter(this._stack.dimensions.length)}'
                  ),
                  PropertyView(Strings.HEIGHT,
                      '${sizeConverter(this._stack.dimensions.height)}'
                  ),
                  PropertyView(Strings.NEW,
                      '${massConverter(this._stack.weights.netExplosive)}'
                  ),
                  PropertyWithHint(Strings.HINT_NET_WEIGHT,
                      Strings.NET_WEIGHT,
                      '${massConverter(this._stack.weights.net)}'
                  ),
                  PropertyWithHint(Strings.HINT_GROSS_WEIGHT,
                      Strings.GROSS_WEIGHT,
                      '${massConverter(this._stack.weights.gross)}'
                  ),
                  PropertyView(Strings.NUMBER_OF_THE_BAA,
                      '${this._stack.battleAirAssetCapacities.current}'
                  ),
                  PropertyView(Strings.MAX_STACK_LEVEL,
                      '${this._stack.maximumStackLevel}'
                  ),
                  stackLevelsListView(this._stack.levels)
                ],
              )
          )
      ),
    );
  }
}
