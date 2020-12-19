import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
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

/// Виджет страницы детальной информации интересного места
class SightDetails extends StatelessWidget {
  final Sight sight;

  SightDetails(this.sight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _gallery(),
              _content(),
              Divider(
                color: PlacesColors.whiteInactive,
              ),
              _actions(),
            ],
          ),
        ),
      ),
    );
  }

  /// Шапка с кнопкой Назад и галереей изображений
  Stack _gallery() {
    return Stack(
      children: [
        Container(
          constraints: BoxConstraints(
            minHeight: 360,
          ),
          child: Image.network(
            this.sight.url,
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

  /// Текстовый контент экрана места - название, описание,
  Container _content() {
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
            this.sight.name,
            style: PlacesFonts.size24_weightBold.copyWith(
              color: PlacesColors.whiteSecondary,
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
                    this.sight.type,
                    style: PlacesFonts.size14WeightBold.copyWith(
                      color: PlacesColors.whiteSecondary,
                    ),
                  ),
                ),
                Text(
                  this.sight.workTime,
                  style: PlacesFonts.size14.copyWith(
                    color: PlacesColors.whiteSecondary2,
                  ),
                )
              ],
            ),
          ),
          Text(
            this.sight.details,
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

  /// Строка действий с интересным местом
  Column _actions() {
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
                        width: 22,
                        height: 19,
                        color: PlacesColors.whiteInactive,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text(
                        PlacesTexts.schedulePlace,
                        style: PlacesFonts.size14.copyWith(
                          color: PlacesColors.whiteInactive,
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
                        width: 20,
                        height: 18,
                        color: PlacesColors.whiteSecondary,
                        margin: EdgeInsets.only(right: 10),
                      ),
                      Text(
                        PlacesTexts.markAsFavourite,
                        style: PlacesFonts.size14.copyWith(
                          color: PlacesColors.whiteSecondary,
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
