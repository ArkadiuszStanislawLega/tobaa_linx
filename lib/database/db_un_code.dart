part of database;

class DatabaseUnCodes {
  static final Map<int, MaterialIdentificationNumber> container = {
    9: MaterialIdentificationNumber(
        shippingName: 'AMUNICJA ZAPALAJĄCA',
        shippingDescription:
            'z lub bez ładunku rozrywającego napędzającego lub miotającego',
        unCode: 9),
    34: MaterialIdentificationNumber(
        shippingName: 'BOMBY',
        shippingDescription: 'z ładunkiem rozrywającym',
        unCode: 34),
    93: MaterialIdentificationNumber(
        shippingName: 'FLARY POWIETRZNE', shippingDescription: '', unCode: 93),
    181: MaterialIdentificationNumber(
        shippingName: 'RAKIETY',
        shippingDescription: 'z ładunkiem rozrywającym',
        unCode: 181),
    197: MaterialIdentificationNumber(
        shippingName: 'SYGNAŁY DYMNE', shippingDescription: '', unCode: 197),
    339: MaterialIdentificationNumber(
        shippingName:
            'Naboje do broni z pociskiem obojętnym lub naboje do broni małokalibrowej ',
        shippingDescription: 'z ładunkiem rozrywającym',
        unCode: 339),
    454: MaterialIdentificationNumber(
        shippingName: 'ZAPŁONNIKI', shippingDescription: '', unCode: 454),
  };
}
