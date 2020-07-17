part of 'parking_bloc.dart';

abstract class ParkingState extends Equatable {
  const ParkingState();
}

class ParkingInitial extends ParkingState {
  @override
  List<Object> get props => [];
}

class ParkingLoaded extends ParkingState {
  final List<Parking> parkings;

  ParkingLoaded(this.parkings);

  @override
  List<Object> get props => [parkings];

  @override
  String toString() => 'ParkingLoaded { Parking: $parkings }';
}
