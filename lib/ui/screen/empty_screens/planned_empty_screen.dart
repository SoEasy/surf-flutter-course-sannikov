import 'package:flutter/material.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/screen/empty_screens/empty_screen.dart';

/// Пустой экран запланированных мест
class PlannedEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      icon: SightIconCard(),
      title: PlacesTexts.emptyScreenTitle,
      text: PlacesTexts.emptyPlannedText,
    );
  }
}
