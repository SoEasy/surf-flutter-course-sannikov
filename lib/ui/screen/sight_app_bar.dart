import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';

class SightAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return Size(double.infinity, 128);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 60,
        bottom: PlacesSizes.primaryPadding,
        left: PlacesSizes.primaryPadding,
        right: PlacesSizes.primaryPadding,
      ),
      child: Text(
        PlacesTexts.sightListTitleBreak,
        textAlign: TextAlign.start,
        maxLines: 2,
        style: PlacesFonts.size32WeightBold.copyWith(
          color: PlacesColors.whiteMain,
        ),
      ),
    );
  }
}
