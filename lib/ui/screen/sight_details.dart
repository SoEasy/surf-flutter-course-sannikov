import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/places_green_button.dart';
import 'package:places/ui/common/sigth_image_preloader.dart';

class _DetailsGallery extends StatefulWidget {
  final Sight _sight;

  _DetailsGallery(this._sight);

  @override
  State<_DetailsGallery> createState() => _DetailsGalleryState();
}

class _DetailsGalleryState extends State<_DetailsGallery> {
  final int _galleryLength = 5;
  Timer? _scrollTimer;
  int _currentIndex = 0;

  PageController _controller = PageController();

  void _handleControllerChange() {
    final double? page = _controller.page;
    if (page != null && page.round() == page && page != _currentIndex) {
      setState(() {
        _currentIndex = page.toInt();
        _tickTimer(_currentIndex == _galleryLength - 1 ? 0 : _currentIndex + 1);
      });
    }
  }

  _tickTimer(int nextSlide) {
    _scrollTimer?.cancel();
    _scrollTimer = Timer(Duration(milliseconds: 1500), () {
      if (nextSlide == 0) {
        _controller.jumpToPage(
          nextSlide
        );
      } else {
        _controller.animateToPage(
          nextSlide,
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }

    });
  }

  @override
  void initState() {
    _controller.addListener(_handleControllerChange);
    _tickTimer(1);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChange);
    _scrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
              height: 360,
              child: PageView.builder(
                controller: _controller,
                itemCount: _galleryLength,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    widget._sight.url,
                    fit: BoxFit.cover,
                    loadingBuilder: sightImagePreloader,
                  );
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 8,
                child: Row(
                  children: [
                    for (int i = 0; i < _galleryLength; i += 1)
                      Expanded(
                        child: i == _currentIndex
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: PlacesColors.textMainLight,
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 16,
          top: 36,
          child: SizedBox(
            width: 32,
            height: 32,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                print('Back from gallery');
              },
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
              color: Theme.of(context).textTheme.bodyText1?.color,
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
                  _sight.workTime ?? '',
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
                  child: TextButton(
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
                  child: TextButton(
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
                            color: Theme.of(context).textTheme.bodyText1?.color,
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
