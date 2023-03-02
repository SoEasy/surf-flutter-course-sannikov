import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/rainbow_button.dart';
import 'package:places/ui/navigation/sight_bottom_navigator.dart';
import 'package:places/ui/screen/add_sight_screen/add_sight_screen.dart';
import 'package:places/ui/screen/cards/sight_list_card.dart';
import 'package:places/ui/screen/sight_app_bar.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';

/// Виджет экрана со списком карточек интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListWidgetState createState() => _SightListWidgetState();
}

class _SightListWidgetState extends State<SightListScreen> {
  void _handleAddPlace() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddSightScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SightAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: PlacesSizes.primaryPadding),
            child: ListView.builder(
              physics: Platform.isIOS ? BouncingScrollPhysics() : ClampingScrollPhysics(),
              itemCount: mocks.length,
              itemBuilder: (BuildContext context, int index) {
                return SightListCard(mocks[index]);
              }
            ),
          ),
          // Container(
          //   padding:
          //       EdgeInsets.symmetric(horizontal: PlacesSizes.primaryPadding),
          //   child: Column(
          //     children: [
          //       for (var i = 0; i < mocks.length; i++) SightListCard(mocks[i])
          //       // SightListCard(mocks[2]),
          //       // SightListCard(mocks[1]),
          //       // SightListCard(mocks[0]),
          //     ],
          //   ),
          // ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RainbowButton(
                  onPressed: _handleAddPlace,
                  child: Row(
                    children: [
                      SightIconPlus(),
                      SizedBox(width: PlacesSizes.primaryHalfPadding,),
                      Text(
                        PlacesTexts.addPlaceTitle.toUpperCase(),
                        style: PlacesFonts.size14WeightBold.copyWith(
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SightBottomNavigator(),
    );
  }
}
