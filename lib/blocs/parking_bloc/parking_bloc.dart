import 'dart:async';

import 'package:bips/models/models.dart';
import 'package:bips/services/services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'parking_event.dart';
part 'parking_state.dart';

class ParkingBloc extends Bloc<ParkingEvent, ParkingState> {
  ParkingBloc() : super(ParkingInitial());

  @override
  Stream<ParkingState> mapEventToState(ParkingEvent event) async* {
    if (event is ParkingStarted) {
      yield* _mapParkingStartedToState();
      // } else if (event is ParkingAdded) {
      //   yield* _mapParkingAddedToState(event);
      // }
    }
  }
}

Stream<ParkingState> _mapParkingStartedToState() async* {
  List<Parking> parkings = await ParkingServices.getParking();
  yield ParkingLoaded(parkings);
}

// Stream<Parking> _mapParkingAddedToState(ParkingAdded event) async* {
//   await ParkingServices.saveParking(
//     // name: event.store.name,
//     // address: event.store.address,
//     // lat: event.store.lat,
//     // long: event.store.long,
//     // userId: event.store.userId,
//     // photo1: event.store.photo1,
//     // photo2: event.store.photo2,
//     // photo3: event.store.photo3,
//     // categoriId: event.store.categoriId,
//     // tahun: event.store.tahun,
//     Parking(event.parking)
//   );

//   List<Parking> parkings = await ParkingServices.getParking();
//   yield ParkingLoaded(parkings);
// }
