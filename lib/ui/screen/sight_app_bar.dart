import 'package:flutter/material.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/screen/filters_screen.dart';
import 'package:places/ui/screen/search_screen/search_screen.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';

/// Кастомный аппбар, чтобы научитсья работать с размерами
class SightAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize {
    return Size.fromHeight(188);
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PlacesTexts.sightListTitleBreak,
            textAlign: TextAlign.start,
            maxLines: 2,
            style: PlacesFonts.size32WeightBold.copyWith(
              color: Theme.of(context).textTheme.headline1?.color,
            ),
          ),
          SearchBar(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchScreen()),
              );
            },
            onInputIconTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FiltersScreen()),
              );
            },
            disabled: true,
            icon: SightIconFilter(),
          ),
        ],
      ),
    );
  }
}
