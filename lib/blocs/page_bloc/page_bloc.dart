import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bips/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage());

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToLoginPage) {
      yield OnLoginPage();
    } else if (event is GoToMainPage) {
      yield OnMainPage();
    } else if (event is GoToReportAddPage) {
      yield OnReportAddPage(event.parking);
    } else if (event is GoToReportConfirmationPage) {
      yield OnReportConfirmationPage(event.parking);
    }
  }
}
