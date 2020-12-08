import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';

enum PlacesButtonSize {
  Small,
  Normal
}

enum PlacesButtonType {
  Primary,
  Secondary
}

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
          color: PlacesColors.White_PrimaryButton
      ),
      child: DefaultTextStyle(
        style: PlacesFonts.size14_weightBold.copyWith(
          color: Colors.white,
        ),
        child: Center(
            child: Container(
              child: this.child,
            )
        ),
      ),
    );
  }
}

class SightDetailsActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        new Expanded(
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
                          color: PlacesColors.White_Inactive,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text(
                            PlacesTexts.SchedulePlace,
                            style: PlacesFonts.size14.copyWith(
                                color: PlacesColors.White_Inactive
                            )
                        )
                      ],
                    )
                )
            )
        ),
        new Expanded(
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
                          color: PlacesColors.White_Secondary,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text(
                            PlacesTexts.MarkAsFavourite,
                            style: PlacesFonts.size14.copyWith(
                                color: PlacesColors.White_Secondary
                            )
                        )
                      ],
                    )
                )
            )
        ),
      ],
    );
  }
}


class SightDetails extends StatelessWidget {
  final Sight sight;

  SightDetails(this.sight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Image.network(
                    this.sight.url,
                    height: 360,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    PlacesSizes.PrimaryPadding,
                    PlacesSizes.PrimaryAndHalfPadding,
                    PlacesSizes.PrimaryPadding, 0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        this.sight.nameSights,
                        style: PlacesFonts.size24_weightBold.copyWith(
                            color: PlacesColors.White_Secondary
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: PlacesSizes.PrimaryAndHalfPadding),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: PlacesSizes.PrimaryPadding),
                              child: Text(
                                  this.sight.type,
                                  style: PlacesFonts.size14_weightBold.copyWith(
                                      color: PlacesColors.White_Secondary
                                  )
                              )
                          ),
                          Text(
                              'Закрыто до 16:00',
                              style: PlacesFonts.size14.copyWith(
                                  color: PlacesColors.White_Secondary2
                              )
                          )
                        ],
                      ),
                    ),
                    Text(
                        this.sight.details,
                        style: PlacesFonts.size14
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: PlacesSizes.PrimaryAndHalfPadding),
                      child: PlacesButton(
                          Text('Построить маршрут')
                      ),
                    ),
                    Divider(
                        color: PlacesColors.White_Inactive
                    ),
                    Padding(padding: EdgeInsets.only(bottom: PlacesSizes.PrimaryHalfPadding)),
                    SightDetailsActions(),
                    Padding(padding: EdgeInsets.only(bottom: PlacesSizes.PrimaryPadding)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
