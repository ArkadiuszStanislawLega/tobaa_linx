part of widgets;

class DetailBaa extends StatefulWidget {
  final BattleAirAsset battleAirAsset;

  DetailBaa(this.battleAirAsset);

  @override
  State<StatefulWidget> createState() {
    return _DetailBaa(this.battleAirAsset);
  }
}

class _DetailBaa extends State<DetailBaa> {
  BattleAirAsset battleAirAsset;

  _DetailBaa(this.battleAirAsset);

  @override
  Widget build(BuildContext context) {
    var box = DatabaseBoxes.container[this.battleAirAsset.boxType]!;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.BACKGROUND,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(text: '${this.battleAirAsset.name}'),
              Tab(text: '${box.name}'),
            ],
          ),
          title: Row(
            children: [
              Text('${this.battleAirAsset.name}'),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent[700]!,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.all(
                      Radius.circular(39.0),
                    ),
                  ),
                ),
                child: Text(
                  this.battleAirAsset.explosionClass.toString(),
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                onPressed: this._showExplosionClass,
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: MediaQuery.of(context).size.width > 400 ? 6 : 3,
              shrinkWrap: true,
              children: [
                LengthPropertyTemplate(this.battleAirAsset.dimensions.length),
                WidthPropertyTemplate(this.battleAirAsset.dimensions.width),
                HeightPropertyTemplate(this.battleAirAsset.dimensions.height),
                GrossWeightPropertyTemplate(this.battleAirAsset.weights.gross),
                NetWeightPropertyTemplate(this.battleAirAsset.weights.net),
                NetExplosiveWeightPropertyTemplate(
                    this.battleAirAsset.weights.netExplosive),
                HexogeneEquivalentPropertyTemplate(
                    this.battleAirAsset.hexogeneEquivalent),
                UnCodePropertyTemplate(
                    this.battleAirAsset.materialIdentificationNumber.unCode),
                TransportNamePropertyTemplate(
                    this.battleAirAsset.materialIdentificationNumber),
              ],
            ),
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: MediaQuery.of(context).size.width > 400 ? 6 : 3,
              children: [
                LengthPropertyTemplate(box.dimensions.length),
                WidthPropertyTemplate(box.dimensions.width),
                HeightPropertyTemplate(box.dimensions.height),
                GrossWeightPropertyTemplate(box.weights.gross),
                NetWeightPropertyTemplate(box.weights.net),
                NetExplosiveWeightPropertyTemplate(box.weights.netExplosive),
                CapacityPropertyTemplate(box.capacities.maximum),
                MaxStackTransPropTemp(box.maxTransportStackLevel),
                MaxStackWarehousePropTemp(box.maxWarehouseStackLevel),
                BaaCounterPropertyTemplate(
                    TOBAAApp.values.containsKey(this.battleAirAsset.type)
                        ? TOBAAApp.values[this.battleAirAsset.type]!
                        : 0)
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showExplosionClass() {
    String compatibilityGroup = this
        .battleAirAsset
        .explosionClass
        .compatibilityGroup
        .convertCompatibilityGroup(
            this.battleAirAsset.explosionClass.compatibilityGroup.group);
    showDialog(
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(Strings.INFORMATION),
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    this._explosionClass(),
                    this._compatibilityGroup(compatibilityGroup)
                  ],
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Text(Strings.CLOSE),
              ),
            ],
          );
        },
        context: this.context);
  }

  Widget _explosionClass() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(Strings.EXPLOSION_SUBCLASS),
              Text(
                '${this.battleAirAsset.explosionClass.explosionSubclass.id}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            '${this.battleAirAsset.explosionClass.explosionSubclass.description}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }

  Widget _compatibilityGroup(String compatibilityGroup) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text('${Strings.COMPATIBILITY_GROUP}'),
              Text(
                '$compatibilityGroup',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            '${this.battleAirAsset.explosionClass.compatibilityGroup.description}',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
