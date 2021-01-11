import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/places_green_button.dart';
import 'package:places/ui/common/sigth_image_preloader.dart';

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
          child: SizedBox(
            width: 32,
            height: 32,
            child: RaisedButton(
              color: Colors.white,
              padding: EdgeInsets.zero,
              elevation: 0,
              onPressed: () {
                print('Back from gallery');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: SightIconArrowLeft()),
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
            style: PlacesFonts.size24WeightBold.copyWith(
              color: Theme.of(context).textTheme.bodyText1.color,
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
                  child: Text(
                    _sight.typeVerbose,
                    style: PlacesFonts.size14WeightBold.copyWith(
                      color: PlacesColors.textSecondary2,
                    ),
                  ),
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
            child: PlacesGreenButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SightIconGo(width: 24.0, height: 24.0, color: Colors.white),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Построить маршрут'.toUpperCase()),
                ],
              ),
              onPressed: () {
                print('Make route to place');
              },
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
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: PlacesSizes.primaryPadding,
      ),
      child: Column(
        children: [
          SizedBox(
            height: PlacesSizes.primaryHalfPadding,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 40,
                  width: double.infinity,
                  child: FlatButton(
                    onPressed: () {
                      print('Schedule');
                    },
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
                  child: FlatButton(
                    onPressed: () {
                      print('Favourite');
                    },
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
      ),
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
