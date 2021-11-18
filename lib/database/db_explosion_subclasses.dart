part of database;

class DatabaseExplosionSubclasses {
  static final Map<double, ExplosionSubclass> container = {
    1.1: ExplosionSubclass(
        id: 1.1,
        description: "Materiały i przedmioty stwarzające zagrożenie wybuchem masowym"),
    1.2: ExplosionSubclass(
      id: 1.2,
      description: "Materiały i przedmioty stwarzające zagrożenie rozrzutem, ale nie wybuchem masowym"),
    1.3: ExplosionSubclass(
        id: 1.3,
        description: "Materiały i przedmioty stwarzające zagrożenie pożarem i małe zagrożenie wybuchem lub rozrzutem, ale bez zagrożenia wybuchem masowym"),
    1.4: ExplosionSubclass(
        id: 1.4,
        description: "Materiały i przedmioty przedstawiające małe zagrożenie w przypadku zapalenia lub zainicjowania; ich oddziaływanie ogranicza się w znacznym stopniu do sztuki przesyłki i nie proawdzi do rozrzutu elementów o znacznym rozmachu lub zasięgu."),
    1.5: ExplosionSubclass(
        id: 1.5,
        description: "Materiały wybuchowe o małej wrażliwości, zagrażające wybuchem masowym. Ich wrażliwość jest tak ogranizona, że prawdopodobieństwo ich zainicjowania lub przejścia od zapalenia do detonacji, w normalnych warunkach jest bardzo małe."),
    1.6: ExplosionSubclass(
        id: 1.6,
        description: "Przedmioty o skrajnie małej wrażliwości, nie zagrażające wybuchem masowym. Zawierają one jedynie materiał o skrajnie małej wrażliwości i stawrzają nieznaczne zagrożenie przypadkową inicjacją lub przeniesieniem(propagacją) wybuchu, przy czym wybuch ten ograniczony jest do pojedynczego przedmiotu."),
  };
}