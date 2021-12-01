part of widgets;

class TransportNamePropertyTemplate extends StatelessWidget {
  final MaterialIdentificationNumber _materialIdentificationNumber;

  TransportNamePropertyTemplate(this._materialIdentificationNumber);

  @override
  Widget build(BuildContext context) {
    return PropertyTextValue(
      name: Strings.TRANSPORT_NAME,
      value:
          '${this._materialIdentificationNumber.shippingName} ${this._materialIdentificationNumber.shippingDescription}',
      background: Colors.grey[500]!,
    );
  }
}
