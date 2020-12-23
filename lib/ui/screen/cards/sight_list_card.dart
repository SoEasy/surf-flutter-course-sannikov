import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/sight_card_base.dart';

/// Виджет карточки интересного места для отображения в списке
class SightListCard extends StatelessWidget {
  final Sight sight;

  SightListCard(this.sight);

  Column _content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // По заданию надо до 50% урезать текст, но ConstrainedBox про другое
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 160,
          ),
          child: Text(
            this.sight.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: PlacesFonts.size16Weight500.copyWith(
              color: PlacesColors.whiteSecondary,
            ),
          ),
        ),
        // А вот эта штука умеет до 50% обрезать
        FractionallySizedBox(
          widthFactor: 0.5,
          child: Text(
            this.sight.details,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: PlacesFonts.size14.copyWith(
              color: PlacesColors.whiteSecondary2,
            ),
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
        SightIconHeart()
      ],
    );
  }
}
