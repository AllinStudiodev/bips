import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import 'blocs/blocs.dart';
import 'services/services.dart';
import 'ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //forced devices orientation to portrait
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  var status = await Permission.storage.status;
  if (status.isUndetermined) {
    print('request permission');
    Permission.storage.request();
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
  }

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
