part of 'services.dart';

class ParkingServices {
  static CollectionReference parkingCollection =
      Firestore.instance.collection('parking');

  static Future<void> saveParking(Parking parking) async {
    String date = formatDate(parking.date);

    await parkingCollection.document(date).setData({
      'name': parking.name ?? "",
      'date': parking.date.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'mobil5': parking.mobil5 ?? 0,
      'mobil7': parking.mobil7 ?? 0,
      'motor': parking.motor ?? 0,
      'truck15': parking.truck15 ?? 0,
      'truck20': parking.truck20 ?? 0,
      'pickup7': parking.pickup7 ?? 0,
      'pickup9': parking.pickup9 ?? 0,
      'trailer25': parking.trailer25 ?? 0,
      'trailer30': parking.trailer30 ?? 0,
      'additionalInformation': parking.additionalInformation ?? 0,
      'additionalIncome': parking.additionalIncome ?? 0,
      'quantity': parking.quantity ?? 0,
      'income': parking.income ?? 0,
    });
  }

  static Future<List<Parking>> getParking() async {
    QuerySnapshot snapshot = await parkingCollection
        .orderBy('date', descending: true)
        .limit(30)
        .getDocuments();

    var documents = snapshot.documents;

    return documents
        .map((e) => Parking(
              name: e.data['name'],
              date: DateTime.fromMillisecondsSinceEpoch(e.data['date']),
              mobil5: e.data['mobil5'],
              mobil7: e.data['mobil7'],
              motor: e.data['motor'],
              pickup7: e.data['pickup7'],
              pickup9: e.data['pickup9'],
              trailer25: e.data['trailer25'],
              trailer30: e.data['trailer30'],
              truck15: e.data['truck15'],
              truck20: e.data['truck20'],
              additionalInformation: e.data['additionalInformation'],
              additionalIncome: e.data['additionalIncome'],
              quantity: e.data['quantity'],
              income: e.data['income'],
            ))
        .toList();
  }
}
