import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/sight_card_action_button.dart';
import 'package:places/ui/common/sight_card_base.dart';

class _ListCardContent extends StatelessWidget {
  final Sight _sight;

  _ListCardContent(this._sight);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // По заданию надо до 50% урезать текст, но ConstrainedBox про другое
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 160,
          ),
          child: Text(
            _sight.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: PlacesFonts.size16Weight500.copyWith(
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
          ),
        ),
        // А вот эта штука умеет до 50% обрезать
        FractionallySizedBox(
          widthFactor: 0.5,
          child: Text(
            _sight.details,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: PlacesFonts.size14.copyWith(
              color: PlacesColors.textSecondary2,
            ),
          ),
        ),
      ],
    );
  }
}

/// Виджет карточки интересного места для отображения в списке
class SightListCard extends StatelessWidget {
  final Sight _sight;

  SightListCard(this._sight);

  @override
  Widget build(BuildContext context) {
    return SightCardBase(
      _sight,
      content: _ListCardContent(_sight),
      actions: [
        SightCardActionButton(
          icon: SightIconHeart(),
          onPressed: () {
            print('Like card on list screen');
          },
        ),
      ],
    );
  }
}
