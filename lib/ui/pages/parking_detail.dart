part of 'pages.dart';

class ParkingDetailPage extends StatefulWidget {
  final Parking parking;

  const ParkingDetailPage({
    Key key,
    this.parking,
  }) : super(key: key);

  @override
  _ParkingDetailPageState createState() => _ParkingDetailPageState();
}

class _ParkingDetailPageState extends State<ParkingDetailPage> {
  int totalMonthlyIncome = 0;

  @override
  void initState() {
    super.initState();
    getMonthlyIncome();
  }

  // @override
  // void dispose() {
  //   getMonthlyIncome();
  //   super.dispose();
  // }

  Future getMonthlyIncome() async {
    //DateTime dateTime = DateTime.now();
    Income income = await IncomeServices.getMonthlyIncome(widget.parking.date);

    setState(() {
      totalMonthlyIncome = income.totalIncome;
    });
  }

  @override
  Widget build(BuildContext context) {
    int incomeMobil5 = 5000 * int.parse(widget.parking.mobil5);
    int incomeMobil7 = 7000 * int.parse(widget.parking.mobil7);
    int incomeMotor = 3000 * int.parse(widget.parking.motor);
    int incomeTruck15 = 15000 * int.parse(widget.parking.truck15);
    int incomeTruck20 = 20000 * int.parse(widget.parking.truck20);
    int incomePickup7 = 7000 * int.parse(widget.parking.pickup7);
    int incomePickup9 = 9000 * int.parse(widget.parking.pickup9);
    int incomeTrailer25 = 25000 * int.parse(widget.parking.trailer25);
    int incomeTrailer30 = 30000 * int.parse(widget.parking.trailer30);
    int additionalIncome = int.parse(widget.parking.additionalIncome);

    int dailyIncome = incomeMobil5 +
        incomeMobil7 +
        incomeMotor +
        incomeTruck15 +
        incomeTruck20 +
        incomePickup7 +
        incomePickup9 +
        incomeTrailer25 +
        incomeTrailer30 +
        additionalIncome;

    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);

          return;
        },
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(color: accentColor1),
              SafeArea(
                  child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 56,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Daily Report\n" +
                                  formatDate(widget.parking.date),
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Image.asset("assets/logo.png"),
                          )
                        ],
                      ),
                    ),

                    // note : DATA TABLE
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          columnSpacing: 45,
                          sortColumnIndex: 0,
                          sortAscending: true,
                          columns: [
                            DataColumn(
                                label: Text("Kendaraan",
                                    style: blackTextFont.copyWith(
                                        fontWeight: FontWeight.w600))),
                            DataColumn(
                                label: Text("Jumlah",
                                    style: blackTextFont.copyWith(
                                        fontWeight: FontWeight.w600)),
                                numeric: true),
                            DataColumn(
                                label: Text("Income",
                                    style: blackTextFont.copyWith(
                                        fontWeight: FontWeight.w600)),
                                numeric: true),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(
                                  Text("Mobil 5.000", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.mobil5}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomeMobil5),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(
                                  Text("Mobil 7.000", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.mobil7}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomeMobil7),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(Text("Motor", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.motor}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomeMotor),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(
                                  Text("Truck 15.000", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.truck15}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomeTruck15),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(
                                  Text("Truck 20.000", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.truck20}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomeTruck20),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(
                                  Text("Pickup 7.000", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.pickup7}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomePickup7),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(
                                  Text("Pickup 9.000", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.pickup9}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomePickup9),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(
                                  Text("Trailer 25.000", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.trailer25}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomeTrailer25),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(
                                  Text("Trailer 30.000", style: blackTextFont)),
                              DataCell(
                                Text("${widget.parking.trailer30}",
                                    style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(incomeTrailer30),
                                    style: blackTextFont),
                              )
                            ]),
                            DataRow(cells: [
                              DataCell(Text("Income Tambahan",
                                  style: blackTextFont)),
                              DataCell(
                                Text("", style: blackTextFont),
                              ),
                              DataCell(
                                Text(formatNumber(additionalIncome),
                                    style: blackTextFont),
                              )
                            ]),
                          ]),
                    ),

                    // note :  TOTAL INCOME
                    SizedBox(height: 15),
                    Text(
                      "Total Quantity Kendaraan : " +
                          "${widget.parking.quantity}",
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(fontSize: 15),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Total Income : Rp " + formatNumber(dailyIncome),
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(fontSize: 15),
                    ),

                    SizedBox(height: 15),
                    Text(
                      "Total Income Bulanan : Rp " +
                          formatNumber(totalMonthlyIncome),
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),

                    SizedBox(height: 15),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
