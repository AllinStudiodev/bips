part of 'pages.dart';

class ReportConfirmationPage extends StatefulWidget {
  final Parking parking;

  ReportConfirmationPage(this.parking);

  @override
  _ReportConfirmationPageState createState() => _ReportConfirmationPageState();
}

class _ReportConfirmationPageState extends State<ReportConfirmationPage> {
  bool loading = false;

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

    int totalIncome = incomeMobil5 +
        incomeMobil7 +
        incomeMotor +
        incomeTruck15 +
        incomeTruck20 +
        incomePickup7 +
        incomePickup9 +
        incomeTrailer25 +
        incomeTrailer30 +
        additionalIncome;

    int totalQuantity = int.parse(widget.parking.mobil5) +
        int.parse(widget.parking.mobil7) +
        int.parse(widget.parking.motor) +
        int.parse(widget.parking.truck15) +
        int.parse(widget.parking.truck20) +
        int.parse(widget.parking.pickup7) +
        int.parse(widget.parking.pickup9) +
        int.parse(widget.parking.trailer25) +
        int.parse(widget.parking.trailer30);

    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToReportAddPage(widget.parking));

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
                                context
                                    .bloc<PageBloc>()
                                    .add(GoToReportAddPage(widget.parking));
                              },
                              child:
                                  Icon(Icons.arrow_back, color: Colors.black),
                            ),
                          ),
                          Center(
                            child: Text(
                              "Daily Report " + formatDate(widget.parking.date),
                              style: blackTextFont.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    ),

                    // note : DATA TABLE
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
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
                      "Total Quantity Kendaraan : " + "$totalQuantity",
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Total Income : Rp " + formatNumber(totalIncome),
                      textAlign: TextAlign.center,
                      style: blackTextFont.copyWith(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),

                    // note : CREATE REPORT
                    SizedBox(height: 15),
                    (loading)
                        ? SpinKitFadingCircle(color: mainColor, size: 45)
                        : SizedBox(
                            width: 250,
                            height: 45,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: mainColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text("Create Daily Report",
                                    style:
                                        whiteTextFont.copyWith(fontSize: 16)),
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });

                                  DocumentSnapshot snapshot =
                                      await ParkingServices.parkingCollection
                                          .document(
                                              formatDate(widget.parking.date))
                                          .get();

                                  if (snapshot.exists) {
                                    print('data harian telah ada');

                                    //data telah ada
                                    Flushbar(
                                      duration: Duration(milliseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xFFFF5C83),
                                      message: "Report Date Already Exist",
                                    )..show(context);

                                    setState(() {
                                      loading = false;
                                    });
                                    return snapshot;
                                  }
                                  if (!snapshot.exists) {
                                    print('data harian disimpan');

                                    //save parking harian
                                    await ParkingServices.saveParking(Parking(
                                      name: widget.parking.name,
                                      date: widget.parking.date,
                                      mobil5: widget.parking.mobil5,
                                      mobil7: widget.parking.mobil7,
                                      motor: widget.parking.motor,
                                      truck15: widget.parking.truck15,
                                      truck20: widget.parking.truck20,
                                      pickup7: widget.parking.pickup7,
                                      pickup9: widget.parking.pickup9,
                                      trailer25: widget.parking.trailer25,
                                      trailer30: widget.parking.trailer30,
                                      additionalInformation:
                                          widget.parking.additionalInformation,
                                      additionalIncome:
                                          widget.parking.additionalIncome,
                                      income: totalIncome,
                                      quantity: totalQuantity,
                                    ));

                                    //save keseluruhan income
                                    await IncomeServices.updateAllIncome(Income(
                                      incomeMobil5: incomeMobil5,
                                      incomeMobil7: incomeMobil7,
                                      incomeMotor: incomeMotor,
                                      incomeTruck15: incomeTruck15,
                                      incomeTruck20: incomeTruck20,
                                      incomePickup7: incomePickup7,
                                      incomePickup9: incomePickup9,
                                      incomeTrailer25: incomeTrailer25,
                                      incomeTrailer30: incomeTrailer30,
                                      additionalIncome: additionalIncome,
                                      totalIncome: totalIncome,
                                      totalQuantity: totalQuantity,
                                    ));

                                    DocumentSnapshot monthlySnapshot =
                                        await IncomeServices.incomeCollection
                                            .document(formatMonth(
                                                widget.parking.date))
                                            .get();

                                    if (monthlySnapshot.exists) {
                                      print('update income bulanan');

                                      //update income bulanan
                                      await IncomeServices.updateMonthlyIncome(
                                          Income(
                                        date: widget.parking.date,
                                        totalIncome: totalIncome,
                                      ));
                                    }
                                    if (!monthlySnapshot.exists) {
                                      print('tambah baru income bulanan');

                                      //tambah baru income bulanan
                                      await IncomeServices.addMonthlyIncome(
                                          Income(
                                        date: widget.parking.date,
                                        totalIncome: totalIncome,
                                      ));
                                    }

                                    Flushbar(
                                      duration: Duration(milliseconds: 1500),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xFFFF5C83),
                                      message: "Report Created",
                                    )..show(context);

                                    context
                                        .bloc<PageBloc>()
                                        .add(GoToMainPage());
                                  }
                                  return null;
                                })),

                    SizedBox(height: 50),
                  ],
                ),
              )),
            ],
          ),
        ));
  }
}
