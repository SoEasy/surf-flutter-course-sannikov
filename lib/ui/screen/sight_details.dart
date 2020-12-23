import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/sigth_image_preloader.dart';

/// Виджет для рисования большой зеленой кнопки на странице информации о месте
/// Потом станет настоящей кнопкой
/// TODO потом проработать primary/secondary button & button group
class PlacesButton extends StatelessWidget {
  final Widget child;

  PlacesButton(
    this.child,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: PlacesColors.whitePrimaryButton,
      ),
      child: DefaultTextStyle(
        style: PlacesFonts.size14WeightBold.copyWith(
          color: Colors.white,
        ),
        child: Center(
          child: Container(
            child: this.child,
          ),
        ),
      ),
    );
  }
}

class _DetailsGallery extends StatelessWidget {
  final Sight _sight;

  _DetailsGallery(this._sight);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(
            minHeight: 360,
          ),
          child: Image.network(
            _sight.url,
            fit: BoxFit.cover,
            loadingBuilder: sightImagePreloader,
          ),
        ),
        Positioned(
          left: 16,
          top: 36,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}

class _DetailsContent extends StatelessWidget {
  final Sight _sight;

  _DetailsContent(this._sight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        PlacesSizes.primaryPadding,
        PlacesSizes.primaryAndHalfPadding,
        PlacesSizes.primaryPadding,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this._sight.name,
            style: Theme.of(context).textTheme.bodyText1.merge(
                  PlacesFonts.size24_weightBold,
                ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: PlacesSizes.primaryAndHalfPadding,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: PlacesSizes.primaryPadding,
                  ),
                  child: Text(_sight.type,
                      style: PlacesFonts.size14WeightBold.copyWith(
                        color: PlacesColors.textSecondary2,
                      )),
                ),
                Text(
                  _sight.workTime,
                  style: PlacesFonts.size14
                      .copyWith(color: PlacesColors.textSecondary2Opacity),
                )
              ],
            ),
          ),
          Text(
            this._sight.details,
            style: PlacesFonts.size14,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: PlacesSizes.primaryAndHalfPadding,
            ),
            child: PlacesButton(
              Text('Построить маршрут'),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: PlacesSizes.primaryHalfPadding,
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 40,
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: SightIconCalendar(
                          withTheme: true,
                          disabled: true,
                        ),
                      ),
                      Text(
                        PlacesTexts.schedulePlace,
                        style: PlacesFonts.size14.copyWith(
                          color: PlacesColors.textSecondary2Opacity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 40,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: SightIconHeart(
                          withTheme: true,
                          isActive: true,
                        ),
                      ),
                      Text(
                        PlacesTexts.markAsFavourite,
                        style: PlacesFonts.size14.copyWith(
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: PlacesSizes.primaryPadding,
          ),
        ),
      ],
    );
  }
}

/// Виджет страницы детальной информации интересного места
class SightDetails extends StatelessWidget {
  final Sight _sight;

  SightDetails(this._sight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DetailsGallery(_sight),
              _DetailsContent(_sight),
              Divider(
                color: PlacesColors.textSecondary2Opacity,
              ),
              _DetailsActions(),
            ],
          ),
        ),
      ),
    );
  }
}
