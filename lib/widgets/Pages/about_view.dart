part of widgets;

class AboutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.ABOUT)),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text('Autorem i główny testerem aplikacji jest Arkadiusz Łęga'),
            Text(
                'Wszelkie spostrzeżenia i informacje o błędach proszę wysyłać na adres e-mail:'),
            SizedBox(
              height: 20,
            ),
            Text(
              'horemheb@vp.pl',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
                'Do napisania aplikacji zostały użyte jawne instrukcje oraz zasoby Internetowe, między innymi wikipedia, strony producentów środków bojowych. Listę linków można uzyskać kontaktując się po przez adres e-mail podany wyżej.'),
            SizedBox(height: 10),
            Text(
                'Działanie aplikacji, dobór pod wględem klas wybuchowości oraz limitów w środkach transportowych opiera się na:'),
            SizedBox(height: 10),
            Text(
                ' - Umowa europejska dotycząca międzynarodowego przewozu drogowego towarów niebezpiecznych'),
            SizedBox(height: 20),
            Text('Elementy aplikacji które wymagają poprawy lub nie działają:'),
            SizedBox(height: 10,),
            Text(' - Obliczanie ilości środków bojowych dla BBU35,'),
            Text(' - Obliczanie ilości środków bojowych dla BBU36,'),
            Text(' - Obliczanie ilości środków bojowych dla CXU-3A/B,'),
            Text(' - Obliczanie ilości środków bojowych dla MK4MOD3.'),
          ],
        ),
      ),
    );
  }
}
