import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/sight_card_base.dart';

/// Виджет карточки интересного места для отображения в списке
class SightVisitedCard extends StatelessWidget {
  final Sight sight;

  SightVisitedCard(this.sight);

  Column _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sight.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: PlacesFonts.size16Weight500.copyWith(
            color: PlacesColors.whiteSecondary,
          ),
        ),
        Text(
          '${PlacesTexts.achievedAt} ${sight.achievedAt}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: PlacesFonts.size14.copyWith(
            color: PlacesColors.whiteSecondary2,
          ),
        ),
        SizedBox(
          height: PlacesSizes.primaryHalfPadding,
        ),
        Text(
          sight.details,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: PlacesFonts.size14.copyWith(
            color: PlacesColors.whiteSecondary2,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SightCardBase(
      sight,
      content: _content(),
      actions: [
        SightIconShare(),
        SightIconClose(),
      ],
    );
  }
}
