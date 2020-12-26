import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:places/ui/screen/sight_list_screen.dart';
import 'package:places/ui/screen/visiting_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: lightTheme,
      theme: darkTheme,
      title: PlacesTexts.appTitle,
      // home: VisitingScreen(),
      // home: SightListScreen(),
      home: SightDetails(mocks[2]),
    );
  }
}
