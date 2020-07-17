part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToReportAddPage extends PageEvent {
  final Parking parking;

  GoToReportAddPage(this.parking);

  @override
  List<Object> get props => [];
}

class GoToReportConfirmationPage extends PageEvent {
  final Parking parking;

  GoToReportConfirmationPage(this.parking);

  @override
  List<Object> get props => [];
}
