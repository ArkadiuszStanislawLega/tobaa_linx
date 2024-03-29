part of widgets;

class BaaListItem extends StatefulWidget {
  final BattleAirAsset baa;

  BaaListItem(this.baa);

  @override
  State<StatefulWidget> createState() {
    return _BaaListItemState(this.baa);
  }
}

class _BaaListItemState extends State<BaaListItem> {
  final BattleAirAsset baa;
  int _userInput = 0;

  _BaaListItemState(this.baa);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(10)),
      ),
      child: Column(children: [this._header(), this._footer()]),
    );
  }

  Widget _header() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
      decoration: BoxDecoration(
        color: Colors.white30,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), topRight: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              AssetNameTemplate(this.baa.name),
              SizedBox(width: 5),
              BoxNameTemplate(this.baa.boxType),
              SizedBox(width: 5),
              HazardClassTemplate(this.baa.explosionClass)
            ],
          ),
          SizedBox(height: 10,),
          TOBAAApp.values.isNotEmpty &&
              TOBAAApp.values.containsKey(baa.type) &&
              TOBAAApp.values[baa.type]! > 0
              ? Row(
            children: [
              ExplosivesWeightTemplate(this.baa.weights.netExplosive *
                  TOBAAApp.values[baa.type]!),
              SizedBox(width: 10,),
              WeightTemplate(this.baa.weights.gross * TOBAAApp.values[baa.type]!)
            ],
          )
              : Container(),
        ],
      ),
    );
  }

  Widget _footer() {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
      child: Stack(
        children: [
          Text(
            converterCombatAssetsTypeToString(baa.combatAssetType),
            style: TextStyle(
              color: Colors.black12,
              fontFamily: 'MiddleAgesDeco',
              fontSize: 35,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                TOBAAApp.values.containsKey(baa.type)
                    ? '${TOBAAApp.values[baa.type]!}'
                    : '${0}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 0, 5, 5),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: ElevatedButton(
                  child: Text(Strings.ADD),
                  onPressed: this._addBaa,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addBaa() {
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(Strings.ADD),
              content: Column(
                children: [
                  Text('${Strings.ADD_TO_TRANSPORT} ${baa.name}'),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration:
                        InputDecoration(hintText: Strings.ENTER_NUMBER_OF_BAA),
                    onChanged: (String str) => str.isNotEmpty
                        ? this._userInput = int.tryParse(str)!
                        : {},
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      TOBAAApp.values[this.baa.type] = this._userInput;
                    });
                    Navigator.pop(context, true);
                  },
                  child: Text(Strings.ADD),
                )
              ]);
        },
        context: context);
  }
}
