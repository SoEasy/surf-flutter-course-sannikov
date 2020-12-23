import 'package:flutter/material.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/screen/empty_screens/empty_screen.dart';

/// Пустой экран посещенных мест
class VisitedEmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EmptyScreen(
      icon: SightIconGo(),
      title: PlacesTexts.emptyScreenTitle,
      text: PlacesTexts.emptyVisitedText,
    );
  }
}
