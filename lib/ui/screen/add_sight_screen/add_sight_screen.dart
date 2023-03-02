import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/places_green_button.dart';
import 'package:places/ui/screen/add_sight_screen/photo_selector.dart';
import 'package:places/ui/screen/add_sight_screen/types.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

import 'add_place_form.dart';

/// Кнопка выбора категории места
class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          PlacesTexts.addPlaceCategoryTitle,
          style: PlacesFonts.size12.copyWith(
            color: Theme.of(context).textTheme.subtitle2?.color,
          ),
        ),
        SizedBox(
          height: 48,
          width: double.infinity,
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                border: BorderDirectional(
                  bottom: BorderSide(
                    color: PlacesColors.textSecondary2Opacity,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Text('Не выбрано'),
                  Spacer(),
                  SightIconArrowRight(
                    withTheme: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
      ],
    );
  }
}

/// Экран создания нового места
class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  AddFormData? formData;
  bool isValid = false;

  void _handleChangeData(AddFormData newFormData) {
    setState(() {
      // Валидация пока херовенькая. Пройдем ключи - сделаю нормально, опираясь на валидность формы
      isValid = newFormData.name != null &&
          newFormData.lat != 0 &&
          newFormData.lon != 0;
      formData = newFormData;
    });
  }

  void _handleSubmit() {
    if (!isValid) {
      return;
    }

    mocks.add(
      Sight(
        name: formData!.name,
        lat: formData!.lat,
        lon: formData!.lon,
        url: 'https://',
        details: formData!.details,
        type: SightType.special,
      ),
    );

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SightListScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          PlacesTexts.addPlaceTitle,
          style: PlacesFonts.size18Weight500.copyWith(
            color: Theme.of(context).textTheme.headline1?.color,
          ),
        ),
        leadingWidth: 90,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            child: Text(
              PlacesTexts.actionCancel,
              style: PlacesFonts.size16Weight500.copyWith(
                color: PlacesColors.textSecondary2,
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PlacesSizes.primaryPadding,
          vertical: PlacesSizes.primaryHalfPadding,
        ),
        child: PlacesGreenButton(
          child: Text(
            PlacesTexts.actionCreate.toUpperCase(),
            style: PlacesFonts.size14WeightBold.copyWith(
              color: Colors.white,
            ),
          ),
          disabled: !isValid,
          onPressed: _handleSubmit,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          PlacesSizes.primaryPadding,
          PlacesSizes.primaryAndHalfPadding,
          PlacesSizes.primaryPadding,
          PlacesSizes.primaryHalfPadding,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PhotoSelector(),
              CategorySelector(),
              AddPlaceForm(
                onChangeForm: _handleChangeData,
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
