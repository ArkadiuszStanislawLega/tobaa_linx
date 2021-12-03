part of widgets;

class CountedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
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
          body: TransportsListView(TOBAAApp.transports.values.toList()));
    } catch (e) {
      return Scaffold(
          appBar: AppBar(
            title: Text(Strings.TRANSPORT),
          ),
          body: Center(
            child: Container(
              color: Colors.orangeAccent,
              child: Text(
                  'Wystąpił błąd. Możliwe że któryś z wybranych środków bojowy jest jeszcze nie dokońca przygotowany do przeprowadzenia obliczeń. Lista spodziewanych błędów i środków które mogą nie działać znajduje się w części aplikacji \"O programie\". Jeżeli ten błąd został spowodowany z przyczyn nie opisanych we wspomnianej cześci aplikacji, daj mi znać.'),
            ),
          ));
    }
  }
}
