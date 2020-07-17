part of 'services.dart';

class IncomeServices {
  static CollectionReference incomeCollection =
      Firestore.instance.collection('income');

  static Future<void> updateIncome(Income income) async {
    DocumentSnapshot snapshot = await incomeCollection.document("MCM").get();

    int initialMobil5 = snapshot.data['incomeMobil5'];
    int initialMobil7 = snapshot.data['incomeMobil7'];
    int initialMotor = snapshot.data['incomeMotor'];
    int initialTruck15 = snapshot.data['incomeTruck15'];
    int initialTruck20 = snapshot.data['incomeTruck20'];
    int initialPickup7 = snapshot.data['incomePickup7'];
    int initialPickup9 = snapshot.data['incomePickup9'];
    int initialTrailer25 = snapshot.data['incomeTrailer25'];
    int initialTrailer30 = snapshot.data['incomeTrailer30'];
    int initialAdditional = snapshot.data['additionalIncome'];
    int initialIncome = snapshot.data['totalIncome'];
    int initialQuantity = snapshot.data['totalQuantity'];

    int totalMobil5 = initialMobil5 + income.incomeMobil5;
    int totalMobil7 = initialMobil7 + income.incomeMobil7;
    int totalMotor = initialMotor + income.incomeMotor;
    int totalTruck15 = initialTruck15 + income.incomeTruck15;
    int totalTruck20 = initialTruck20 + income.incomeTruck20;
    int totalPickup7 = initialPickup7 + income.incomePickup7;
    int totalPickup9 = initialPickup9 + income.incomePickup9;
    int totalTrailer25 = initialTrailer25 + income.incomeTrailer25;
    int totalTrailer30 = initialTrailer30 + income.incomeTrailer30;
    int totalAdditional = initialAdditional + income.additionalIncome;
    int totalIncome = initialIncome + income.totalIncome;
    int totalQuantity = initialQuantity + income.totalQuantity;

    await incomeCollection.document("MCM").setData({
      'date': DateTime.now().millisecondsSinceEpoch,
      'incomeMobil5': totalMobil5,
      'incomeMobil7': totalMobil7,
      'incomeMotor': totalMotor,
      'incomeTruck15': totalTruck15,
      'incomeTruck20': totalTruck20,
      'incomePickup7': totalPickup7,
      'incomePickup9': totalPickup9,
      'incomeTrailer25': totalTrailer25,
      'incomeTrailer30': totalTrailer30,
      'additionalIncome': totalAdditional,
      'totalIncome': totalIncome,
      'totalQuantity': totalQuantity,
    });
  }

  static Future<Income> getIncome() async {
    DocumentSnapshot snapshot = await incomeCollection.document("MCM").get();

    return Income(
      totalIncome: snapshot.data['totalIncome'],
      totalQuantity: snapshot.data['totalQuantity'],
    );
  }
}
