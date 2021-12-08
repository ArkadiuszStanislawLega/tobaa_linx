part of widgets;

class BoxesListView extends StatelessWidget {
  final List<Box> _boxes;

  BoxesListView(this._boxes);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 450) {
      return GridView.builder(
        primary: false,
        padding: const EdgeInsets.all(10),
        itemCount: this._boxes.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              onTap: () {
                Navigator.pushNamed(context, Url.BOX_DETAIL,
                    arguments: {Keys.SELECTED_BOX: this._boxes.elementAt(index), Keys.CHOSEN_INDEX: index});
              },
              title: BoxListItem(this._boxes.elementAt(index), index));
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.6,
          crossAxisCount: 2,
        ),
      );
    } else {
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
}
