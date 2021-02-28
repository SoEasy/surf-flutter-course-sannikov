import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/switch_tab_indicator.dart';
import 'package:places/ui/navigation/sight_bottom_navigator.dart';
import 'package:places/ui/screen/cards/sight_favourite_card.dart';
import 'package:places/ui/screen/cards/sight_visited_card.dart';

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
    mocks[2],
    mocks[1],
    mocks[0],
  ];

  List<Sight> _plannedPlaces = [
    mocks[0],
    mocks[1],
    mocks[2],
  ];

  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        bottom: PreferredSize(
          child: SwitchTabIndicator(
            tabController,
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
            color: Theme.of(context).textTheme.bodyText1.color,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: PlacesSizes.primaryAndHalfPadding),
        child: TabBarView(
          controller: tabController,
          children: [
            // PlannedEmptyScreen(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: PlacesSizes.primaryPadding),
                child: Column(
                  children: _plannedPlaces
                      .map((Sight item) => SightFavouriteCard(
                            item,
                            key: ValueKey(item.id),
                            onDelete: _handleDeletePlanned,
                          ))
                      .toList(),
                ),
              ),
            ),
            // VisitedEmptyScreen(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: PlacesSizes.primaryPadding),
                child: Column(
                  children: _visitedPlaces
                      .map((Sight item) => SightVisitedCard(
                            item,
                            key: ValueKey(item.id),
                            onDelete: _handleDeleteVisited,
                          ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SightBottomNavigator(),
    );
  }
}
