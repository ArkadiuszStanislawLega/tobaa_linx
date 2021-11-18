part of widgets;

class CountedView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    if (TOBAAApp.transports.isNotEmpty) TOBAAApp.transports.clear();

    TOBAAApp.selectedCars.forEach((key, value) {
      if (value) {
        var transport = new Transport();
        transport.selectedCar = key;
        transport.isWarTime = TOBAAApp.isWar;
        transport.createTransport(TOBAAApp.values);
        TOBAAApp.transports[key] = transport;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.TRANSPORT),
      ),
      backgroundColor: AppColors.BACKGROUND,
      body: TransportsListView(TOBAAApp.transports.values.toList())
    );
  }
}