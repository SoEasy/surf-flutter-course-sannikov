import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/navigation/sight_bottom_navigator.dart';
import 'package:places/ui/screen/cards/sight_list_card.dart';
import 'package:places/ui/screen/sight_app_bar.dart';

/// Виджет экрана со списком карточек интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListWidgetState createState() => _SightListWidgetState();
}

class _SightListWidgetState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SightAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: PlacesSizes.primaryPadding),
          child: Column(
            children: [
              SightListCard(mocks[2]),
              SightListCard(mocks[1]),
              SightListCard(mocks[0]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SightBottomNavigator(),
    );
  }
}
