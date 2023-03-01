import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/sight_card_action_button.dart';
import 'package:places/ui/common/sight_card_base.dart';
import 'package:places/ui/common/types.dart';

class _VisitedCardContent extends StatelessWidget {
  final Sight _sight;

  _VisitedCardContent(this._sight);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _sight.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: PlacesFonts.size16Weight500.copyWith(
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
        ),
        Text(
          '${PlacesTexts.achievedAt} ${_sight.achievedAt}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: PlacesFonts.size14.copyWith(
            color: PlacesColors.textSecondary2,
          ),
        ),
        SizedBox(
          height: PlacesSizes.primaryHalfPadding,
        ),
        Text(
          _sight.details,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: PlacesFonts.size14.copyWith(
            color: PlacesColors.textSecondary2,
          ),
        ),
      ],
    );
  }
}

/// Виджет карточки интересного места для отображения в списке
class SightVisitedCard extends StatelessWidget {
  final OnDeleteCardCallback onDelete;
  final Key key;
  final Sight _sight;

  SightVisitedCard(this._sight, {required this.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return SightCardBase(
      _sight,
      onDelete: () {
        onDelete?.call(_sight);
      },
      content: _VisitedCardContent(_sight),
      actions: [
        SightCardActionButton(
          icon: SightIconShare(),
          onPressed: () {
            print('Click share on visited card');
          },
        ),
        SightCardActionButton(
          icon: SightIconClose(),
          onPressed: () {
            onDelete?.call(_sight);
          },
        ),
      ],
    );
  }
}
