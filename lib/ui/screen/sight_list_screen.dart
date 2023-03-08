import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_colors.dart';
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
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                shadowColor: Colors.transparent,
                expandedHeight: 188,
                collapsedHeight: 56,
                flexibleSpace: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                    final top = constraints.biggest.height;
                    return FlexibleSpaceBar(
                      title: top == 115
                          ? Text(
                              PlacesTexts.sightListTitle,
                              style: PlacesFonts.size18Weight500.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    ?.color,
                              ),
                            )
                          : null,
                      background: SightAppBar(),
                    );
                  },
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: PlacesSizes.primaryPadding,
                      ),
                      child: SightListCard(mocks[index]),
                    );
                  },
                  childCount: mocks.length,
                ),
              ),
            ],
          ),
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
                        SizedBox(
                          width: PlacesSizes.primaryHalfPadding,
                        ),
                        Text(
                          PlacesTexts.addPlaceTitle.toUpperCase(),
                          style: PlacesFonts.size14WeightBold.copyWith(
                            color: Colors.white,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SightBottomNavigator(),
    );
  }
}
