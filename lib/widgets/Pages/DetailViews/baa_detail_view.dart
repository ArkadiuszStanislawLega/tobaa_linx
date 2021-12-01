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
              ElevatedButton(
                child: Text('${this.battleAirAsset.explosionClass.toString()}'),
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
              crossAxisCount: 3,
              shrinkWrap: true,
              children: [
                LengthPropertyTemplate(this.battleAirAsset.dimensions.length),
                WidthPropertyTemplate(this.battleAirAsset.dimensions.width),
                HeightPropertyTemplate(this.battleAirAsset.dimensions.height),
                GrossWeightPropertyTemplate(this.battleAirAsset.weights.gross),
                NetWeightPropertyTemplate(this.battleAirAsset.weights.net),
                NetExplosiveWeightPropertyTemplate(
                    this.battleAirAsset.weights.netExplosive),
                PropertyGameTemplate(
                  name: Strings.HEXOGEN_EQUIVALENT,
                  value:
                      '${massConverter(this.battleAirAsset.hexogeneEquivalent)}',
                  background: Colors.grey[500]!,
                ),
                PropertyGameTemplate(
                  name: Strings.UN_CODE,
                  value:
                      '${intToUnCodeConverter(this.battleAirAsset.materialIdentificationNumber.unCode)}',
                  background: Colors.grey[500]!,
                ),
                PropertyTextValue(
                  name: Strings.TRANSPORT_NAME,
                  value:
                      '${this.battleAirAsset.materialIdentificationNumber.shippingName} ${this.battleAirAsset.materialIdentificationNumber.shippingDescription}',
                  background: Colors.grey[500]!,
                ),
              ],
            ),
            GridView.count(
              primary: false,
              padding: const EdgeInsets.all(5),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: [
                PropertyGameTemplate(
                  name: Strings.LENGTH,
                  value: '${sizeConverter(box.dimensions.length)}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.WIDTH,
                  value: '${sizeConverter(box.dimensions.width)}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.HEIGHT,
                  value: '${sizeConverter(box.dimensions.height)}',
                  background: Colors.grey[300]!,
                ),
                PropertyGameTemplate(
                  name: Strings.CONTAINER_NET_WEIGHT,
                  value: '${massConverter(box.weights.net)}',
                  background: Colors.grey[400]!,
                ),
                PropertyGameTemplate(
                  name: Strings.CONTAINER_FULLY_LOADED_GROSS_WEIGHT,
                  value: '${massConverter(box.weights.gross)}',
                  background: Colors.grey[400]!,
                ),
                PropertyGameTemplate(
                  name: Strings.CONTAINER_FULLY_LOADED_NEW,
                  value: '${massConverter(box.weights.netExplosive)}',
                  background: Colors.grey[400]!,
                ),
                PropertyGameTemplate(
                  name: Strings.CAPACITY,
                  value: '${box.capacities.maximum}',
                  background: Colors.grey[500]!,
                ),
                PropertyGameTemplate(
                  name: Strings.MAX_STACK_HEIGHT_DURING_TRANSPORT,
                  value: '${box.maxTransportStackLevel} szt.',
                  background: Colors.grey[500]!,
                ),
                PropertyGameTemplate(
                  name: Strings.MAX_WAREHOUSE_STACK_LEVEL,
                  value: '${box.maxWarehouseStackLevel} szt.',
                  background: Colors.grey[500]!,
                ),
                PropertyGameTemplate(
                  name: Strings.NUMBER_OF_CHOSEN_BAA,
                  value: TOBAAApp.values.containsKey(this.battleAirAsset.type)
                      ? '${TOBAAApp.values[this.battleAirAsset.type]} szt.'
                      : '0 szt.',
                  background: Colors.grey[600]!,
                ),
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
