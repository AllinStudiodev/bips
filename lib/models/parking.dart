part of 'models.dart';

class Parking extends Equatable {
  final String name;
  final DateTime date;
  final String mobil5;
  final String mobil7;
  final String motor;
  final String truck15;
  final String truck20;
  final String pickup7;
  final String pickup9;
  final String trailer25;
  final String trailer30;
  final String additionalInformation;
  final String additionalIncome;
  final int quantity;
  final int income;

  Parking({
    this.name,
    this.date,
    this.mobil5,
    this.mobil7,
    this.motor,
    this.truck15,
    this.truck20,
    this.pickup7,
    this.pickup9,
    this.trailer25,
    this.trailer30,
    this.additionalInformation,
    this.additionalIncome,
    this.quantity,
    this.income,
  });

  @override
  List<Object> get props => [
        name,
        date,
        mobil5,
        mobil7,
        motor,
        truck15,
        truck20,
        pickup7,
        pickup9,
        trailer25,
        trailer30,
        additionalInformation,
        additionalIncome,
        quantity,
        income,
      ];
}
