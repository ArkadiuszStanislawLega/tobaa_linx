part of widgets;

class StacksListView extends StatelessWidget {
  final List<WarehouseStack> _stacks;

  StacksListView(this._stacks);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > 400) {
      return GridView.builder(
        primary: false,
        padding: const EdgeInsets.all(10),
        itemCount: this._stacks.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              onTap: () {
                Navigator.pushNamed(context, Url.STACK_DETAIL,
                    arguments: {Keys.SELECTED_STACK: this._stacks.elementAt(index), Keys.CHOSEN_INDEX: index});
              },
              title: StackListItem(this._stacks.elementAt(index), index));
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.6,
          crossAxisCount: 2,
        ),
      );
    } else {
      return new ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: this._stacks.length,
        itemBuilder: (context, index) {
          return Center(
            child: ListTile(
              onTap: () {
                Navigator.pushNamed(context, Url.STACK_DETAIL,
                    arguments: {Keys.SELECTED_STACK: this._stacks.elementAt(index), Keys.CHOSEN_INDEX: index});
              },
              title: StackListItem(this._stacks.elementAt(index), index),
            ),
          );
        },
      );
    }
  }
}
