import 'package:flutter/material.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';

class NoSearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Распорка
        Container(),
        SightIconSearch(
          width: 64.0,
          height: 64.0,
        ),
        Padding(
          padding: EdgeInsets.only(
            top: PlacesSizes.primaryAndHalfPadding,
            bottom: PlacesSizes.primaryHalfPadding,
          ),
          child: Text(
            PlacesTexts.nothingFoundTitle,
            style: PlacesFonts.size18Weight500.copyWith(
              color: Theme.of(context).textTheme.subtitle2.color,
            ),
          ),
        ),
        Text(
          PlacesTexts.nothigFoundSubtitle,
          style: PlacesFonts.size14.copyWith(
            color: Theme.of(context).textTheme.subtitle2.color,
          ),
        )
      ],
    );
  }
}
