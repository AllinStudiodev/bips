part of 'parking_bloc.dart';

abstract class ParkingEvent extends Equatable {
  const ParkingEvent();
}

class ParkingStarted extends ParkingEvent {
  @override
  List<Object> get props => [];
}

class ParkingAdded extends ParkingEvent {
  //ambil parking model dari repository
  final Parking parking;

  const ParkingAdded(this.parking);

  @override
  List<Object> get props => [parking];

  //catet di bloc delegate, evennya
  @override
  String toString() => 'ParkingAdded{parking: $parking}';
}

//meload parking ketika ada tambah data
class ParkingUpdated extends ParkingEvent {
  final List<Parking> parking;

  const ParkingUpdated(this.parking);

  @override
  List<Object> get props => [parking];

  @override
  String toString() => 'ParkingLoaded{parking: $parking}';
}
