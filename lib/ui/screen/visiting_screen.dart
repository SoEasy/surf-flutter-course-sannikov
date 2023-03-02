import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/lib.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/switch_tab_indicator.dart';
import 'package:places/ui/navigation/sight_bottom_navigator.dart';
import 'package:places/ui/screen/cards/sight_favourite_card.dart';
import 'package:places/ui/screen/cards/sight_visited_card.dart';
import 'package:places/ui/screen/empty_screens/planned_empty_screen.dart';
import 'package:places/ui/screen/empty_screens/visited_empty_screen.dart';

import '../../mocks.dart';

/// Класс для экрана "Избранное"
/// Включает два таба - "хочу посетить" и "посетил"
class VisitingScreen extends StatefulWidget {
  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen>
    with SingleTickerProviderStateMixin {
  List<Sight> _visitedPlaces = [
    mocks[3],
    mocks[2],
    mocks[1],
    mocks[0],
  ];

  List<Sight> _plannedPlaces = [
    mocks[0],
    mocks[1],
    mocks[2],
    mocks[3],
  ];

  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController?.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  void _handleDeletePlanned(Sight sightToDelete) {
    setState(() {
      _plannedPlaces = _plannedPlaces
          .where((Sight element) => element != sightToDelete)
          .toList();
    });
  }

  void _handleDeleteVisited(Sight sightToDelete) {
    setState(() {
      _visitedPlaces = _visitedPlaces
          .where((Sight element) => element != sightToDelete)
          .toList();
    });
  }

  void _moveVisitedItemTo(Sight item, Sight target) {
    final itemIndex = _visitedPlaces.indexOf(item);
    int targetIndex = _visitedPlaces.indexOf(target);

    setState(() {
      _visitedPlaces.removeAt(itemIndex);
      _visitedPlaces.insert(targetIndex, item);
    });
  }

  void _movePlannedItemTo(Sight item, Sight target) {
    final itemIndex = _plannedPlaces.indexOf(item);
    int targetIndex = _plannedPlaces.indexOf(target);

    setState(() {
      _plannedPlaces.removeAt(itemIndex);
      _plannedPlaces.insert(targetIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        bottom: PreferredSize(
          child: SwitchTabIndicator(
            tabController!,
            items: [
              PlacesTexts.visitingPlanned,
              PlacesTexts.visitingVisited,
            ],
          ),
          preferredSize: Size.fromHeight(52),
        ),
        title: Text(
          PlacesTexts.favouritesTitle,
          style: PlacesFonts.size18.copyWith(
            color: Theme.of(context).textTheme.bodyText1?.color,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: PlacesSizes.primaryAndHalfPadding),
        child: TabBarView(
          controller: tabController,
          children: [
            _plannedPlaces.length == 0
                ? PlannedEmptyScreen()
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: PlacesSizes.primaryPadding,
                    ),
                    child: ListView.builder(
                      physics: Platform.isIOS
                          ? BouncingScrollPhysics()
                          : ClampingScrollPhysics(),
                      itemCount: _plannedPlaces.length,
                      itemBuilder: (BuildContext context, int index) {
                        Sight item = _plannedPlaces[index];
                        return DnDContainer(
                          data: item,
                          onAccept: (Sight data) {
                            _movePlannedItemTo(data, item);
                          },
                          child: SightFavouriteCard(
                            item,
                            onDelete: _handleDeletePlanned,
                          ),
                          dropPlaceholderBuilder: (Sight? data) {
                            return Opacity(
                              opacity: .3,
                              child: SightFavouriteCard(
                                data!,
                                onDelete: _handleDeletePlanned,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
            _visitedPlaces.length == 0
                ? VisitedEmptyScreen()
                : Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: PlacesSizes.primaryPadding,
                    ),
                    child: ListView.builder(
                      physics: Platform.isIOS
                          ? BouncingScrollPhysics()
                          : ClampingScrollPhysics(),
                      itemCount: _visitedPlaces.length,
                      itemBuilder: (BuildContext context, int index) {
                        Sight item = _visitedPlaces[index];
                        return DnDContainer(
                          data: item,
                          onAccept: (Sight data) {
                            _moveVisitedItemTo(data, item);
                          },
                          child: SightVisitedCard(
                            item,
                            key: ValueKey(item.id),
                            onDelete: _handleDeleteVisited,
                          ),
                          dropPlaceholderBuilder: (Sight? data) {
                            return Opacity(
                              opacity: .3,
                              child: SightFavouriteCard(
                                data!,
                                onDelete: _handleDeletePlanned,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: SightBottomNavigator(),
    );
  }
}
