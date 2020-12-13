import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';

/// Виджет карточки интересного места для отображения в списке
class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  Widget _image() {
    return Stack(
      children: [
        // В задании было слово Image, а дальше гугл, дело-то не хитрое :)
        Image.network(
          sight.url,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 96,
        ),
        Positioned(
          top: 19,
          right: 18,
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.purple,
            ),
          ),
        ),
        Positioned(
          top: PlacesSizes.primaryPadding,
          left: PlacesSizes.primaryPadding,
          child: Text(
            sight.type,
            style: PlacesFonts.size14WeightBold.copyWith(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Container _content() {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: PlacesColors.whiteBackground,
      ),
      padding: EdgeInsets.all(
        PlacesSizes.primaryPadding,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.sight.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: PlacesFonts.size16Weight500.copyWith(
              color: PlacesColors.whiteSecondary,
            ),
          ),
          Text(
            this.sight.details,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: PlacesFonts.size14.copyWith(
              color: PlacesColors.whiteSecondary2,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      // Искал как заставить контейнер имитировать что-то типа overflow: hidden в CSS
      // Чтоб контейнеру задал borderRadius, и никто его не перекрывал
      // и нашел вот это
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [_image(), _content()],
      ),
    );
  }
}
