part of widgets;

class PropertyGameTemplate extends StatelessWidget {
  final String name;
  final String value;
  final Color background;
  final Color fontColor;

  PropertyGameTemplate(
      {this.name = '',
      this.value = '',
      this.background = Colors.white,
      this.fontColor = Colors.black});

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
           topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0)
        ),
      ),
      // padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            this.value,
            style: TextStyle(
              color: this.fontColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              this.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
