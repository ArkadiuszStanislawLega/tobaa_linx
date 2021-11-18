part of widgets;

class TransportsListView extends StatelessWidget {
  final List<Transport> _transports;

  TransportsListView(this._transports);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: this._transports.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.pushNamed(context, Url.TRANSPORT_DETAIL, arguments: {
              Keys.SELECTED_TRANSPORT: this._transports.elementAt(index)
            });
          },
          title: TransportListItem(
            this._transports.elementAt(index),
          ),
        );
      },
    );
  }
}
