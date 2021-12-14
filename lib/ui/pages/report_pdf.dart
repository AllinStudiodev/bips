import 'dart:io';

import 'package:bips/models/models.dart';
import 'package:bips/services/services.dart';
import 'package:bips/shared/shared.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApi {
  static Future<File> generateReport(Parking parking) async {
    Income income = await IncomeServices.getMonthlyIncome(parking.date);
    final int totalIncome = income.totalIncome;
    final pdf = Document();
    final imageJpg =
        (await rootBundle.load('assets/logo.png')).buffer.asUint8List();
    final pageTheme = PageTheme(
      pageFormat: PdfPageFormat.a4,
    );

    pdf.addPage(
      MultiPage(
        pageTheme: pageTheme,
        build: (context) => [
          buildTitle(parking, imageJpg),
          buildContent(parking),
          Divider(),
          buildTotal(parking, totalIncome),
          buildFooter(parking),
        ],
      ),
    );

    return saveDocument(
      name: 'parking_report ' + formatDate(parking.date) + '.pdf',
      pdf: pdf,
    );
  }

  static Future<File> saveDocument({
    String name,
    Document pdf,
  }) async {
    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    print(file);

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    final url = file.path;

    await OpenFile.open(url);
  }

  static Widget buildTitle(Parking parking, imageJpg) => Padding(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "DAILY REPORT",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.5 * PdfPageFormat.mm),
              Text(
                formatDate(parking.date),
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ]),
            Image(
              MemoryImage(imageJpg),
              height: 40.0,
            ),
          ],
        ),
      );

  static Widget buildContent(Parking parking) {
    final headers = ['Kendaraan', 'Jumlah', 'Income'];

    final int incomeMobil5 = 5000 * int.parse(parking.mobil5);
    final int incomeMobil7 = 7000 * int.parse(parking.mobil7);
    final int incomeMotor = 3000 * int.parse(parking.motor);
    final int incomeTruck15 = 15000 * int.parse(parking.truck15);
    final int incomeTruck20 = 20000 * int.parse(parking.truck20);
    final int incomePickup7 = 7000 * int.parse(parking.pickup7);
    final int incomePickup9 = 9000 * int.parse(parking.pickup9);
    final int incomeTrailer25 = 25000 * int.parse(parking.trailer25);
    final int incomeTrailer30 = 30000 * int.parse(parking.trailer30);
    final int additionalIncome = int.parse(parking.additionalIncome);

    final data = <List>[
      [
        'Mobil 5.000',
        parking.mobil5,
        formatNumber(incomeMobil5),
      ],
      [
        'Mobil 7.000',
        parking.mobil7,
        formatNumber(incomeMobil7),
      ],
      [
        'Motor',
        parking.motor,
        formatNumber(incomeMotor),
      ],
      [
        'Truck 15.000',
        parking.truck15,
        formatNumber(incomeTruck15),
      ],
      [
        'Truck 20.000',
        parking.truck20,
        formatNumber(incomeTruck20),
      ],
      [
        'Pickup 7.000',
        parking.pickup7,
        formatNumber(incomePickup7),
      ],
      [
        'Pickup 9.000',
        parking.pickup9,
        formatNumber(incomePickup9),
      ],
      [
        'Trailer 25.000',
        parking.trailer25,
        formatNumber(incomeTrailer25),
      ],
      [
        'Trailer 30.000',
        parking.trailer30,
        formatNumber(incomeTrailer30),
      ],
      [
        'Income Tambahan',
        '',
        formatNumber(additionalIncome),
      ],
    ];

    return Table.fromTextArray(
      headers: headers,
      data: data,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      border: null,
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(Parking parking, totalIncome) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Total Kendaraan :',
                  value: parking.quantity.toString(),
                  unite: true,
                ),
                buildText(
                  title: 'Total Income :',
                  value: 'Rp. ' + formatNumber(parking.income),
                  unite: true,
                ),
                buildText(
                  title: 'Total Income Bulanan:',
                  value: 'Rp. ' + formatNumber(totalIncome),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static buildText({
    String title,
    String value,
    double width = double.infinity,
    TextStyle titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }

  static Widget buildFooter(Parking parking) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Address',
              value: 'Jl. Lebak bulus raya no.1, Jakarta Selatan'),
          SizedBox(height: 1 * PdfPageFormat.mm),
          buildSimpleText(
              title: 'Contact Me',
              value: 'https://www.instagram.com/allinstudio.co.id'),
        ],
      );

  static buildSimpleText({
    String title,
    String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }
}
