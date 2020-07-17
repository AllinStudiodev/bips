part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnReportAddPage extends PageState {
  final Parking parking;

  OnReportAddPage(this.parking);

  @override
  List<Object> get props => [];
}

class OnReportConfirmationPage extends PageState {
  final Parking parking;

  OnReportConfirmationPage(this.parking);

  @override
  List<Object> get props => [];
}
