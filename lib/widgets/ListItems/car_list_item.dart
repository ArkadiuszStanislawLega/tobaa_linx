part of widgets;

class CarListItem extends StatelessWidget {
  final Car _car;
  final int _index;

  CarListItem(this._car, this._index);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      shadowColor: Colors.teal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: Row(
          children: [this._left(), this._right()],
        ),
      ),
    );
  }

  Widget _left() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.all(7),
      color: Colors.grey,
      child: Column(
        children: [
          Text(
            Strings.CAR,
            style: TextStyle(fontSize: 11, color: Colors.black45),
          ),
          Text(
            '${this._index + 1}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _right() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.fromLTRB(4.0, 7.0, 4.0, 7.0),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [this._topRight(), this._botRight()],
        ),
      ),
    );
  }

  Widget _topRight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [this._explosionWeightContainer(), this._explosionClassContainer()],
    );
  }

  Widget _explosionWeightContainer() {
    return ChipIconTemplate(
        label: '${massConverter(this._car.weightOfLoadingArea.currentNetExplosive)}',
        icon: Icons.flare,
        backgroundColor: Colors.blueGrey,
        fontColor: Colors.white);
  }

  Widget _explosionClassContainer() {
    return ChipTemplate(
      label: this._car.explosionClass.toString(),
      backgroundColor: Colors.deepOrange,
      fontColor: Colors.white,
    );
  }

  Widget _botRight() {
    List<String> baaList = [];
    List<Widget> widgets = [];
    Map<BattleAirAssetType, int> container = {};

    this._car.stacks.forEach(
      (stack) {
        stack.levels.forEach(
          (level) {
            level.boxes.forEach(
              (box) {
                var value = 0;
                if (container.containsKey(box.battleAirAsset.type)) value = container[box.battleAirAsset.type]!;
                container[box.battleAirAsset.type] = value + box.capacities.current;
              },
            );
          },
        );
      },
    );

    container.forEach(
      (key, value) {
        var ba = DatabaseAssets.container[key]!;
        baaList.add("${ba.name} - $value ${Strings.PCS}");
      },
    );

    baaList.forEach((baa) {
      widgets.add(
        Chip(
          backgroundColor: Colors.lightBlue,
          shadowColor: Colors.black,
          elevation: 4.0,
          label: Text(
            baa,
            style: TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right,
          ),
        ),
      );
    });
    return Column(children: widgets);
  }
}
