import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/switch_tab_indicator.dart';
import 'package:places/ui/navigation/sight_bottom_navigator.dart';

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
      body: TabBarView(
        controller: tabController,
        children: [
          Center(child: Text('1')),
          Center(child: Text('2')),
        ],
      ),
      bottomNavigationBar: SightBottomNavigator(),
    );
  }
}
