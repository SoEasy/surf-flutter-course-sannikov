import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/screen/sight_card.dart';

/// Виджет экрана со списком карточек интересных мест
class SightListScreen extends StatefulWidget {
  @override
  _SightListWidgetState createState() => _SightListWidgetState();
}

class _SightListWidgetState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 40, bottom: 16),
          child: Text(
            PlacesTexts.sightListTitleBreak,
            textAlign: TextAlign.start,
            maxLines: 2,
            style: PlacesFonts.size32WeightBold.copyWith(
              color: PlacesColors.White_Main,
            ),
          ),
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        toolbarHeight: 128,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: PlacesSizes.primaryPadding),
          child: Column(
            children: [
              SightCard(mocks[2]),
              SightCard(mocks[1]),
              SightCard(mocks[0]),
            ],
          ),
        ),
      ),
    );
  }
}
