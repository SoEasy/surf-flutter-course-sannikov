import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/shared/theme_notifier.dart';
import 'package:places/ui/screen/add_sight_screen.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/settings_screen.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  bool _isDarkTheme = false;

  @override
  void initState() {
    super.initState();
    themeNotifier.addListener(() {
      setState(() {
        _isDarkTheme = !_isDarkTheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? darkTheme : lightTheme,
      // theme: darkTheme,
      title: PlacesTexts.appTitle,
      home: SightAddScreen(),
      // home: VisitingScreen(),
      // home: SightListScreen(),
      // home: SightDetails(mocks[2]),
      // home: FiltersScreen(),
      // home: SettingScreen(),
    );
  }
}
