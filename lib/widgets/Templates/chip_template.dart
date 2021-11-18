part of widgets;

class ChipTemplate extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final String label;

  ChipTemplate(
      {this.backgroundColor = Colors.deepOrange,
      this.fontColor = Colors.white,
      this.label = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
        color: this.backgroundColor,
        border: Border.all(color: this.backgroundColor, width: 4.0),
        borderRadius: BorderRadius.all(
          Radius.circular(39.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            spreadRadius: 3,
            blurRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        this.label,
        style: TextStyle(
            fontSize: 11, color: this.fontColor, fontWeight: FontWeight.bold),
        textAlign: TextAlign.right,
      ),
    );
  }
}
