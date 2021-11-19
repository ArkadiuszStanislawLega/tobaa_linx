part of models;

class MaterialIdentificationNumber {
  late int unCode;
  late String shippingName;
  late String shippingDescription;

  MaterialIdentificationNumber.empty() {
    this.unCode = 0;
    this.shippingName = '';
    this.shippingDescription = '';
  }

  MaterialIdentificationNumber(
      {
        required this.unCode,
      required this.shippingName,
      required this.shippingDescription});
}
