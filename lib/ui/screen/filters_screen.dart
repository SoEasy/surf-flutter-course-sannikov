import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/places_green_button.dart';
import 'package:places/ui/common/sigth_filter_checkbox.dart';

const double searchMinDistance = 100;
const double searchMaxDistance = 10000;
const double searchDistanceStep = 100;
final int searchDivisions =
    ((searchMaxDistance - searchMinDistance) / searchDistanceStep).round();

/// При надобности тут можно сделать пересчет в километры и вообще красоту всякую
String _verboseDistance(RangeValues distanceRange) {
  return 'От ${distanceRange.start.round()} до ${distanceRange.end.round()} м';
}

/// Класс виджета-экрана фильтров
class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _searchDistance =
      RangeValues(searchMinDistance, searchMaxDistance);

  Map<SightType, bool> _selectedTypes = {
    SightType.hotel: false,
    SightType.restaurant: false,
    SightType.special: false,
    SightType.park: false,
    SightType.museum: false,
    SightType.cafe: false,
  };

  void _handleChangeDistance(RangeValues values) {
    setState(() {
      _searchDistance = values;
    });
  }

  void _handleSelectType(SightType selectedType) {
    setState(() {
      _selectedTypes[selectedType] = !_selectedTypes[selectedType];
    });
  }

  void _handleResetClick() {
    setState(() {
      _selectedTypes.forEach((key, _) {
        _selectedTypes[key] = false;
      });
      _searchDistance = RangeValues(searchMinDistance, searchMaxDistance);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _filterAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: PlacesSizes.primaryAndHalfPadding,
          ),
          _filterTypes(),
          SizedBox(height: 60),
          _filterSlider(),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: PlacesSizes.primaryPadding,
              right: PlacesSizes.primaryPadding,
              bottom: PlacesSizes.primaryHalfPadding,
            ),
            child: PlacesGreenButton(
              child: Text(
                'Показать (190)'.toUpperCase(),
                style: PlacesFonts.size14.copyWith(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                print('Do filter');
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _filterTypes() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: PlacesSizes.primaryAndHalfPadding,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SightFilterCheckbox(
                icon: SightIconCatalogHotel(),
                value: _selectedTypes[SightType.hotel],
                sightType: SightType.hotel,
                onChanged: _handleSelectType,
                title: PlacesTexts.sightTypeHotel,
              ),
              SightFilterCheckbox(
                icon: SightIconCatalogRestaurant(),
                value: _selectedTypes[SightType.restaurant],
                sightType: SightType.restaurant,
                onChanged: _handleSelectType,
                title: PlacesTexts.sightTypeRestaurant,
              ),
              SightFilterCheckbox(
                icon: SightIconCatalogSpecial(),
                value: _selectedTypes[SightType.special],
                sightType: SightType.special,
                onChanged: _handleSelectType,
                title: PlacesTexts.sightTypeSpecial,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SightFilterCheckbox(
                icon: SightIconCatalogPark(),
                value: _selectedTypes[SightType.park],
                sightType: SightType.park,
                onChanged: _handleSelectType,
                title: PlacesTexts.sightTypePark,
              ),
              SightFilterCheckbox(
                icon: SightIconCatalogMuseum(),
                value: _selectedTypes[SightType.museum],
                sightType: SightType.museum,
                onChanged: _handleSelectType,
                title: PlacesTexts.sightTypeMuseum,
              ),
              SightFilterCheckbox(
                icon: SightIconCatalogCafe(),
                value: _selectedTypes[SightType.cafe],
                sightType: SightType.cafe,
                onChanged: _handleSelectType,
                title: PlacesTexts.sightTypeCafe,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _filterSlider() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: PlacesSizes.primaryPadding,
          ),
          child: Row(
            children: [
              Text(
                PlacesTexts.filterDistanceTitle,
                style: PlacesFonts.size16.copyWith(
                  color: Theme.of(context).textTheme.headline1.color,
                ),
              ),
              Spacer(),
              Text(
                _verboseDistance(_searchDistance),
                style: PlacesFonts.size16.copyWith(
                  color: PlacesColors.textSecondary2Opacity,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: PlacesSizes.primaryAndHalfPadding,
        ),
        SizedBox(
          height: 16,
          child: RangeSlider(
            values: _searchDistance,
            min: searchMinDistance,
            max: searchMaxDistance,
            divisions: searchDivisions,
            onChanged: _handleChangeDistance,
          ),
        ),
      ],
    );
  }

  Widget _filterAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: SizedBox(
        width: 32,
        height: 32,
        child: FlatButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            print('Click back on filters');
          },
          child: SightIconArrowLeft(
            withTheme: true,
          ),
        ),
      ),
      actions: [
        FlatButton(
          onPressed: _handleResetClick,
          child: Text(
            'Очистить',
            style: PlacesFonts.size16.copyWith(
              color: Theme.of(context).buttonColor,
            ),
          ),
        ),
      ],
    );
  }
}
