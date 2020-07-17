part of 'pages.dart';

class ReportAddPage extends StatefulWidget {
  final Parking parking;

  ReportAddPage(this.parking);

  @override
  _ReportAddPageState createState() => _ReportAddPageState();
}

class _ReportAddPageState extends State<ReportAddPage> {
  List<DateTime> dates;
  DateTime selectedDate;

  TextEditingController mobil5Controller = TextEditingController();
  TextEditingController mobil7Controller = TextEditingController();
  TextEditingController motorController = TextEditingController();
  TextEditingController truck15Controller = TextEditingController();
  TextEditingController truck20Controller = TextEditingController();
  TextEditingController pickup7Controller = TextEditingController();
  TextEditingController pickup9Controller = TextEditingController();
  TextEditingController trailer25Controller = TextEditingController();
  TextEditingController trailer30Controller = TextEditingController();
  TextEditingController additionalIncomeController = TextEditingController();
  TextEditingController additionalInformationController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    dates = List.generate(
        7, (index) => DateTime.now().subtract(Duration(days: index)));
    selectedDate = dates[1];

    mobil5Controller.text = widget.parking.mobil5;
    mobil7Controller.text = widget.parking.mobil7;
    motorController.text = widget.parking.motor;
    truck15Controller.text = widget.parking.truck15;
    truck20Controller.text = widget.parking.truck20;
    pickup7Controller.text = widget.parking.pickup7;
    pickup9Controller.text = widget.parking.pickup9;
    trailer25Controller.text = widget.parking.trailer25;
    trailer30Controller.text = widget.parking.trailer30;
    additionalInformationController.text = widget.parking.additionalInformation;
    additionalIncomeController.text = widget.parking.additionalIncome;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor1)));

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());

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
                              context.bloc<PageBloc>().add(GoToMainPage());
                            },
                            child: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Create Daily Report",
                            style: blackTextFont.copyWith(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),

                  // note: CHOOSE DATE
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 0, defaultMargin, 10),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: defaultMargin),
                    height: 90,
                    child: ListView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: dates.length,
                        itemBuilder: (_, index) => Container(
                              margin: EdgeInsets.only(
                                  left: (index < dates.length - 1) ? 10 : 0),
                              child: DateCard(
                                dates[index],
                                isSelected: selectedDate == dates[index],
                                onTap: () {
                                  setState(() {
                                    selectedDate = dates[index];
                                    print(selectedDate);
                                  });
                                },
                              ),
                            )),
                  ),

                  // note: TAMBAH MOTOR
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: motorController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Motor 3.000",
                              hintText: "Motor 3.000"),
                        ),
                      ),
                    ],
                  ),

                  // note: TAMBAH MOBIL
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: mobil5Controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Mobil 5.000",
                              hintText: "Mobil 5.000"),
                        ),
                      ),
                      SizedBox(width: defaultMargin),
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: mobil7Controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Mobil 7.000",
                              hintText: "Mobil 7.000"),
                        ),
                      ),
                    ],
                  ),

                  // note: TAMBAH TRUCK
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: truck15Controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Truck 15.000",
                              hintText: "Truck 15.000"),
                        ),
                      ),
                      SizedBox(width: defaultMargin),
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: truck20Controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Truck 20.000",
                              hintText: "Truck 20.000"),
                        ),
                      ),
                    ],
                  ),

                  // note: TAMBAH PICKUP
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: pickup7Controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Pickup 7.000",
                              hintText: "Pickup 7.000"),
                        ),
                      ),
                      SizedBox(width: defaultMargin),
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: pickup9Controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Pickup 9.000",
                              hintText: "Pickup 9.000"),
                        ),
                      ),
                    ],
                  ),

                  // note: TAMBAH TRAILER
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: trailer25Controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Trailer 25.000",
                              hintText: "Trailer 25.000"),
                        ),
                      ),
                      SizedBox(width: defaultMargin),
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: trailer30Controller,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Trailer 30.000",
                              hintText: "Trailer 30.000"),
                        ),
                      ),
                    ],
                  ),

                  // note: ADDITIONAL INFORMATION
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          controller: additionalInformationController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Informasi Tambahan",
                              hintText: "Tiket Hilang / Kendaraan Inap"),
                        ),
                      ),
                    ],
                  ),

                  // note: ADDITIONAL INCOME
                  SizedBox(height: 15),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: TextField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.number,
                          controller: additionalIncomeController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: "Income Tambahan",
                              hintText: "Jumlah Income Tambahan"),
                        ),
                      ),
                    ],
                  ),

                  // note : BUTTON GO TO REPORT CONFIRMATION
                  SizedBox(height: 15),
                  Align(
                      alignment: Alignment.topCenter,
                      child: BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => FloatingActionButton(
                            child: Icon(Icons.arrow_forward),
                            backgroundColor: mainColor,
                            elevation: 0,
                            onPressed: () async {
                              if (!(mobil5Controller.text.trim() != "" &&
                                  mobil7Controller.text.trim() != "" &&
                                  motorController.text.trim() != "" &&
                                  truck15Controller.text.trim() != "" &&
                                  truck20Controller.text.trim() != "" &&
                                  pickup7Controller.text.trim() != "" &&
                                  pickup9Controller.text.trim() != "" &&
                                  trailer25Controller.text.trim() != "" &&
                                  trailer30Controller.text.trim() != "" &&
                                  additionalIncomeController.text.trim() !=
                                      "")) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: "Please fill all the fields",
                                )..show(context);
                              } else if (((mobil5Controller.text
                                          .startsWith('0')) &&
                                      (mobil5Controller.text.length > 1)) ||
                                  ((mobil7Controller.text.startsWith('0')) &&
                                      (mobil7Controller.text.length > 1)) ||
                                  ((motorController.text.startsWith('0')) &&
                                      (motorController.text.length > 1)) ||
                                  ((pickup7Controller.text.startsWith('0')) &&
                                      (pickup7Controller.text.length > 1)) ||
                                  ((pickup9Controller.text.startsWith('0')) &&
                                      (pickup9Controller.text.length > 1)) ||
                                  ((trailer25Controller.text.startsWith('0')) &&
                                      (trailer25Controller.text.length > 1)) ||
                                  ((trailer30Controller.text.startsWith('0')) &&
                                      (trailer30Controller.text.length > 1)) ||
                                  ((truck15Controller.text.startsWith('0')) &&
                                      (truck15Controller.text.length > 1)) ||
                                  ((truck20Controller.text.startsWith('0')) &&
                                      (truck20Controller.text.length > 1)) ||
                                  ((additionalIncomeController.text
                                          .startsWith('0')) &&
                                      (additionalIncomeController.text.length >
                                          1))) {
                                Flushbar(
                                  duration: Duration(milliseconds: 1500),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  backgroundColor: Color(0xFFFF5C83),
                                  message: "Invalid number format",
                                )..show(context);
                              } else {
                                context
                                    .bloc<PageBloc>()
                                    .add(GoToReportConfirmationPage(Parking(
                                      name: (userState as UserLoaded).user.name,
                                      date: selectedDate,
                                      mobil5: mobil5Controller.text,
                                      mobil7: mobil7Controller.text,
                                      motor: motorController.text,
                                      truck15: truck15Controller.text,
                                      truck20: truck20Controller.text,
                                      pickup7: pickup7Controller.text,
                                      pickup9: pickup9Controller.text,
                                      trailer25: trailer25Controller.text,
                                      trailer30: trailer30Controller.text,
                                      additionalInformation:
                                          additionalInformationController.text,
                                      additionalIncome:
                                          additionalIncomeController.text,
                                    )));
                              }
                            }),
                      )),

                  SizedBox(height: 30),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
