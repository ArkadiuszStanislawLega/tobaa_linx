part of widgets;

class PropertyTextValue extends StatelessWidget {
  final String name;
  final String value;
  final Color background;
  final Color fontColor;

  const PropertyTextValue(
      {Key? key,
      this.name = '',
      this.value = '',
      this.background = Colors.white,
      this.fontColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: this.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(color: this.background, width: 4.0),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
      ),
      // padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            this.value,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: this.fontColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            this.name,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black45, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
