part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  const ThemeState(this.themeData);

  List<Object> get props => [themeData];
}
