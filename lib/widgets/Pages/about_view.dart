part of widgets;

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.ABOUT)),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text('Autorem i główny testerem aplikacji jest Arkadiusz Łęga'),
              Text('Wszelkie spostrzeżenia i informacje o błędach proszę wysyłać na adres e-mail:'),
              SizedBox(
                height: 20,
              ),
              Text(
                'horemheb@vp.pl',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                  'Do napisania aplikacji zostały użyte jawne instrukcje oraz zasoby Internetowe, między innymi wikipedia, strony producentów środków bojowych. Listę linków można uzyskać kontaktując się po przez adres e-mail podany wyżej.'),
              SizedBox(height: 10),
              Text(
                  'Działanie aplikacji, dobór pod wględem klas wybuchowości oraz limitów w środkach transportowych opiera się na:'),
              SizedBox(height: 10),
              Text(' - Umowa europejska dotycząca międzynarodowego przewozu drogowego towarów niebezpiecznych'),
              SizedBox(height: 20),
              Text('Elementy aplikacji które wymagają poprawy lub nie działają:'),
              SizedBox(height: 10),
              Text(' - Obliczanie ilości środków bojowych dla BBU35,'),
              Text(' - Obliczanie ilości środków bojowych dla MK4MOD3.'),
              SizedBox(height: 20),
              Text(
                  'Różnica po między obliczaniem ładunków dla pojazdów w czasie pokoju i wojny są nastepujące. Dla czasu wojnu jest brany limit tylko i wyłącznie masowy oraz rozmiarowy dla danego typu pojazdu. Dla czasu pokoju brane są te same co dla wojny, ale dodatkow spradzane są wymagania które narzucają klasy wybuchowości - limit ładunków wybuchowych znajdujących się na pojazdach.'),
              SizedBox(height: 20),
              Text(
                  'Kolejność podawania środków bojowych ma znaczenie. Obliczenia są prowadze kolejno w zależności od wproawdzonych ilość środków, np. jeżeli wproawdzimy najpier AIM9X - 1000sz., a później AGM65 50szt., po mimo iż na liście jest wyżej obliczenia zostaną przeprowadzone w kolejności: 1000szt AIM9X,a później 50szt. AGM65.'),
              Text(
                  'Dla poprawności wykonanych obliczeń, zalecane jest najpierw dodawanie środków bojowych o największych gabarytach.')
            ],
          ),
        ),
      ),
    );
  }
}
