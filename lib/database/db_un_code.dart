part of database;

class DatabaseUnCodes {
  static final Map<int, MaterialIdentificationNumber> container = {
    9: MaterialIdentificationNumber(
        shippingName: 'Amunicja zapalająca',
        shippingDescription:
            'z lub bez ładunku rozrywającego napędzającego lub miotającego',
        unCode: 9),
    34: MaterialIdentificationNumber(
        shippingName: 'Bomby',
        shippingDescription: 'z ładunkiem rozrywającym',
        unCode: 34),
    91: MaterialIdentificationNumber(
        shippingName: 'Flary powietrzne', shippingDescription: '', unCode: 91),
    181: MaterialIdentificationNumber(
        shippingName: 'Rakiety',
        shippingDescription: 'z ładunkiem rozrywającym',
        unCode: 181),
    197: MaterialIdentificationNumber(
        shippingName: 'Sygnały dymne', shippingDescription: '', unCode: 197),
    339: MaterialIdentificationNumber(
        shippingName:
            'Naboje do broni z pociskiem obojętnym lub naboje do broni małokalibrowej ',
        shippingDescription: 'z ładunkiem rozrywającym',
        unCode: 339),
    454: MaterialIdentificationNumber(
        shippingName: 'Zapłonniki', shippingDescription: '', unCode: 454),
  };
}
