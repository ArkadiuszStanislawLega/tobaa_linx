part of widgets;

class BoxesListView extends StatelessWidget {
  final List<Box> _boxes;

  BoxesListView(this._boxes);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: this._boxes.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, Url.BOX_DETAIL,
                arguments: {Keys.SELECTED_BOX: this._boxes.elementAt(index)});
          },
          title: BoxListItem(this._boxes.elementAt(index), index),
        );
      },
    );
  }
}
