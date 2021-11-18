part of widgets;

class StackLevelsListView extends StatelessWidget {
  final List<StackLevel> _levels;

  StackLevelsListView(this._levels);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: this._levels.length,
      itemBuilder: (context, index) {
        return ListTile(
              onTap: () {
                Navigator.pushNamed(context, Url.STACK_LEVEL_DETAIL,
                    arguments: {
                      Keys.SELECTED_STACK_LEVEL: this._levels.elementAt(index),
                      Keys.CHOSEN_INDEX: index
                    });
              },
              title: StackLevelListItem(this._levels.elementAt(index), index)
        );
      },
    );
  }
}
