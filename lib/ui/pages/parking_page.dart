part of 'pages.dart';

class ParkingPage extends StatefulWidget {
  ParkingPage() : super();

  @override
  ParkingPageState createState() => ParkingPageState();
}

class ParkingPageState extends State<ParkingPage> {
  final _debouncer = Debouncer(milliseconds: 500);
  List<Parking> parkings = List();
  List<Parking> filteredParkings = List();

  @override
  void initState() {
    super.initState();

    ParkingServices.getParking().then((parkingsFromServer) {
      setState(() {
        print("list parking");
        parkings = parkingsFromServer;
        filteredParkings = parkings;
      });
    });
  }

  @override
  void dispose() {
    parkings = null;
    filteredParkings = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(15.0),
                  hintText: 'Find By Date',
                  hintStyle:
                      blackTextFont.copyWith(fontWeight: FontWeight.w100)),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    filteredParkings = parkings
                        .where((u) => (formatDate(u.date)
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 100),
              itemCount: filteredParkings.length,
              itemBuilder: (BuildContext context, int index) {
                return ParkingCard(
                  parking: filteredParkings[index],
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) {
                        return ParkingDetailPage(
                          parking: filteredParkings[index],
                        );
                      }),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
