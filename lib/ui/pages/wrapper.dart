part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToLoginPage)) {
        prevPageEvent = GoToLoginPage();
        context.bloc<PageBloc>().add(GoToLoginPage());
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnLoginPage)
            ? SignInPage()
            : (pageState is OnReportAddPage)
                ? ReportAddPage(pageState.parking)
                : (pageState is OnReportConfirmationPage)
                    ? ReportConfirmationPage(pageState.parking)
                    : MainPage());
  }
}
