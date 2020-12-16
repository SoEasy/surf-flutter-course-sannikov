import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/common/sigth_image_preloader.dart';

/// Виджет карточки интересного места для отображения в списке
class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard(this.sight);

  Widget _image() {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(
            minHeight: 96,
          ),
          child: Image.network(
            sight.url,
            fit: BoxFit.cover,
            width: double.infinity,
            loadingBuilder: SightImagePreloader,
          ),
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
      padding: EdgeInsets.only(
        left: PlacesSizes.primaryPadding,
        right: PlacesSizes.primaryPadding,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: PlacesSizes.primaryPadding,
          ),
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
        color: PlacesColors.whiteBackground,
      ),
      // Искал как заставить контейнер имитировать что-то типа overflow: hidden в CSS
      // Чтоб контейнеру задал borderRadius, и никто его не перекрывал
      // и нашел вот это
      clipBehavior: Clip.hardEdge,
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Column(
          children: [_image(), _content()],
        ),
      ),
    );
  }
}
