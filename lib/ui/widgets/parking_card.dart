part of 'widgets.dart';

class ParkingCard extends StatelessWidget {
  final Parking parking;
  final GestureTapCallback onTap;

  ParkingCard({this.parking, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
          trailing: Icon(Icons.arrow_right),
          onTap: onTap,
          title: Hero(
            tag: '${parking.date}__heroTag',
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                formatDate(parking.date),
                style: blackTextFont,
              ),
            ),
          ),
          subtitle: Text(
            "Income:  Rp. " + formatNumber(parking.income),
            style: blackTextFont.copyWith(fontSize: 17),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )),
    );
  }
}
