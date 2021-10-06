import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tobaa/car/car.dart';
import 'package:tobaa/stack/stack.dart' as ContainerStack;
import 'package:tobaa/main.dart';

class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //TODO: Poprawić to dla każdego samochodu powinien tworzyć nowy transport
    TOBAAApp.selectedCars.forEach((key, value) {
      if (value) {
        TOBAAApp.transport.addCar(key);
      }
    });

    TOBAAApp.transport.createTransport(TOBAAApp.values);

    return Scaffold(
      appBar: AppBar(
        title: Text("Transport"),
      ),
      body: Container(
          child: new SingleChildScrollView(
              child: Column(
                  children: [
                    Text('${TOBAAApp.transport.transportGrossWeight}'),
                    Text('${TOBAAApp.transport.transportNetExplosiveWeight}'),
                    Text('${TOBAAApp.transport.transportNetWeight}'),
                    Text('${TOBAAApp.transport.numberOfCars}'),
                    this._carsListView(TOBAAApp.transport.cars
                      // Text('${transport.transportGrossWeight}')
                    )
                  ])
          )
      ),
    );
  }

  Widget _carsListView(List<Car> cars){
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: cars.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
              onTap: (){
                // TOBAAApp.selectedCars.add(assets.elementAt(index));
                // Navigator.pushNamed(context, TOBAAApp.URL_DETAIL);
              },
              title: this._car(cars.elementAt(index))
          ),
        );
      },
    );
  }

  Widget _listViewStack(List<ContainerStack.Stack> stacks){
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: stacks.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
              onTap: (){
                // TOBAAApp.selectedCars.add(assets.elementAt(index));
                // Navigator.pushNamed(context, TOBAAApp.URL_DETAIL);
              },
              title: this._stack(stacks.elementAt(index))
          ),
        );
      },
    );
  }

  Widget _stack(ContainerStack.Stack stack){
    return Column(
      children: [
        Text('STOS'),
        Text('NEW: ${stack.weights.netExplosive}'),
        Text('Waga netto: ${stack.weights.net}'),
        Text('Waga brutto: ${stack.weights.gross}'),
        Text('Ilość kontenerów: ${stack.currentNumberOfBoxes}'),
        Text('Ilość środków: ${stack.battleAirAssetCapacities.current}'),
      ],
    );
  }

  Widget _car(Car car){
    return Column(
      children: [
        Text('Nazwa pojazdu: ${car.name}'),
        Text('Klasa wybuchowości: ${car.explosionClass.toString()}'),

        Text('NEW: ${car.weightOfLoadingArea.currentNetExplosive}'),
        Text('Waga ładunku: ${car.weightOfLoadingArea.current}'),
        Text('Ilość stosów: ${car.stacks.length}'),
        this._listViewStack(car.stacks)
      ],
    );
  }
}