import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/switch_tab_indicator.dart';
import 'package:places/ui/navigation/sight_bottom_navigator.dart';
import 'package:places/ui/screen/cards/sight_favourite_card.dart';
import 'package:places/ui/screen/cards/sight_visited_card.dart';
import 'package:places/ui/screen/empty_screens/empty_screen.dart';
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
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
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
            color: PlacesColors.whiteMain,
          ),
        ),
      ),
      body: Padding(
        // Дизайн в Map и в 4.6 разнятся про этот отступ
        // В 4.6 правильный - полуторный отступ
        // В Map - 30, какое-то непонятное значение
        padding: EdgeInsets.only(top: PlacesSizes.primaryAndHalfPadding),
        child: TabBarView(
          controller: tabController,
          children: [
            // PlannedEmptyScreen(),
            SingleChildScrollView(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: PlacesSizes.primaryPadding),
                child: Column(
                  children: [
                    SightFavouriteCard(mocks[2]),
                    SightFavouriteCard(mocks[1]),
                    SightFavouriteCard(mocks[0]),
                  ],
                ),
              ),
            ),
            // VisitedEmptyScreen(),
            SingleChildScrollView(
              child: Container(
                padding:
                EdgeInsets.symmetric(horizontal: PlacesSizes.primaryPadding),
                child: Column(
                  children: [
                    SightVisitedCard(mocks[0]),
                    SightVisitedCard(mocks[1]),
                    SightVisitedCard(mocks[2]),
                  ],
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
