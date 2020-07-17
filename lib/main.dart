import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'services/services.dart';
import 'ui/pages/pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //forced devices orientation to portrait
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(create: (_) => ParkingBloc()..add(ParkingStarted())),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (_, themeState) => MaterialApp(
            theme: themeState.themeData,
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          ),
        ),
      ),
    );
  }
}
