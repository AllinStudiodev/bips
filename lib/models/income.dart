part of 'models.dart';

class Income extends Equatable {
  final DateTime date;
  final int incomeMobil5;
  final int incomeMobil7;
  final int incomeMotor;
  final int incomeTruck15;
  final int incomeTruck20;
  final int incomePickup7;
  final int incomePickup9;
  final int incomeTrailer25;
  final int incomeTrailer30;
  final int additionalIncome;
  final int totalIncome;
  final int totalQuantity;

  Income({
    this.date,
    this.incomeMobil5,
    this.incomeMobil7,
    this.incomeMotor,
    this.incomeTruck15,
    this.incomeTruck20,
    this.incomePickup7,
    this.incomePickup9,
    this.incomeTrailer25,
    this.incomeTrailer30,
    this.additionalIncome,
    this.totalIncome,
    this.totalQuantity,
  });

  @override
  List<Object> get props => [
        date,
        incomeMobil5,
        incomeMobil7,
        incomeMotor,
        incomeTruck15,
        incomeTruck20,
        incomePickup7,
        incomePickup9,
        incomeTrailer25,
        incomeTrailer30,
        additionalIncome,
        totalIncome,
        totalQuantity,
      ];
}
