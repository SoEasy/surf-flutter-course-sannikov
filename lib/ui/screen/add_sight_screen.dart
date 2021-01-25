import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/places_green_button.dart';
import 'package:places/ui/screen/sight_list_screen.dart';

/// Виджет для отрисовки тектсового поля с лейблом наверху
class InputWithLabel extends StatelessWidget {
  final String label;
  final Widget child;

  InputWithLabel({
    @required this.label,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final _isLight = Theme.of(context).brightness == Brightness.light;
    final _borderColor = _isLight
        ? PlacesColors.primaryButtonLight.withOpacity(0.4)
        : PlacesColors.primaryButtonDark.withOpacity(0.4);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: PlacesFonts.size12.copyWith(
            color: Theme.of(context).textTheme.subtitle2.color,
          ),
        ),
        SizedBox(
          height: PlacesSizes.primaryPaddingWithoutFourth,
        ),
        Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: _borderColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: _borderColor,
                ),
              ),
            ),
          ),
          child: child,
        ),
      ],
    );
  }
}

/// Кнопка выбора категории места
class CategorySelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'КАТЕГОРИЯ',
          style: PlacesFonts.size12.copyWith(
            color: Theme.of(context).textTheme.subtitle2.color,
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

class AddFormData {
  final String name;
  final double lat;
  final double lon;
  final String details;

  AddFormData({
    this.name,
    this.lat,
    this.lon,
    this.details,
  });

  AddFormData update({name, lat, lon, details}) {
    return AddFormData(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      details: details ?? this.details,
    );
  }
}

class AddPlaceForm extends StatefulWidget {
  final void Function(AddFormData data) onChangeForm;

  @override
  _AddPlaceFormState createState() => _AddPlaceFormState();

  AddPlaceForm({
    @required this.onChangeForm,
  });
}

final latRegExp = RegExp(r'^\-?(\d|([1-8]\d))(\.\d+)?$');
final lonRegExp = RegExp(r'^\-?(1(80|[0-7]\d)|\d{1,2})(\.\d+)?$');

final FocusNode titleFocusNode = FocusNode();
final FocusNode latFocusNode = FocusNode();
final FocusNode lonFocusNode = FocusNode();
final FocusNode detailsFocusNode = FocusNode();

class _AddPlaceFormState extends State<AddPlaceForm> {
  AddFormData formData = AddFormData(name: '', lat: 0, lon: 0, details: '');

  void _changeFocus(FocusNode currentNode, FocusNode nextNode) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputWithLabel(
          label: 'Название',
          child: SizedBox(
            height: 40,
            child: TextFormField(
              focusNode: titleFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                _changeFocus(titleFocusNode, latFocusNode);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String value) {
                return value.length > 0 ? null : '';
              },
              onChanged: (String value) {
                formData = formData.update(name: value);
                widget.onChangeForm(formData);
              },
              decoration: InputDecoration(
                errorStyle: TextStyle(height: 0),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
              ),
              style: PlacesFonts.size16.copyWith(
                color: Theme.of(context).textTheme.headline1.color,
              ),
            ),
          ),
        ),
        SizedBox(
          height: PlacesSizes.primaryAndHalfPadding,
        ),
        Row(
          children: [
            Expanded(
              child: InputWithLabel(
                label: 'Широта',
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    focusNode: latFocusNode,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.numberWithOptions(
                      signed: true,
                      decimal: true,
                    ),
                    onFieldSubmitted: (_) {
                      _changeFocus(latFocusNode, lonFocusNode);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value) {
                      return latRegExp.hasMatch(value) ? null : '';
                    },
                    onChanged: (String value) {
                      double newValue = double.tryParse(value);
                      if (newValue == null) {
                        return;
                      }
                      formData = formData.update(lat: newValue);
                      widget.onChangeForm(formData);
                    },
                    decoration: InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                    style: PlacesFonts.size16.copyWith(
                        color: Theme.of(context).textTheme.headline1.color,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: InputWithLabel(
                label: 'Долгота',
                child: SizedBox(
                  height: 40,
                  child: TextFormField(
                    focusNode: lonFocusNode,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    onFieldSubmitted: (_) {
                      _changeFocus(lonFocusNode, detailsFocusNode);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String value) {
                      return lonRegExp.hasMatch(value) ? null : '';
                    },
                    onChanged: (String value) {
                      double newValue = double.tryParse(value);
                      if (newValue == null) {
                        return;
                      }
                      formData = formData.update(lon: newValue);
                      widget.onChangeForm(formData);
                    },
                    decoration: InputDecoration(
                      errorStyle: TextStyle(height: 0),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                    ),
                    style: PlacesFonts.size16.copyWith(
                        color: Theme.of(context).textTheme.headline1.color,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: PlacesSizes.primaryPadding,
        ),
        GestureDetector(
          onTap: () {
            print('Show on map');
          },
          child: Text(
            PlacesTexts.actionSelectOnMap,
            style: PlacesFonts.size16Weight500.copyWith(
              color: Theme.of(context).buttonColor,
            ),
          ),
        ),
        SizedBox(
          height: 37,
        ),
        InputWithLabel(
          label: 'Описание',
          child: SizedBox(
            height: 80,
            child: TextFormField(
              focusNode: detailsFocusNode,
              textInputAction: TextInputAction.done,
              style: PlacesFonts.size16.copyWith(
                  color: Theme.of(context).textTheme.headline1.color,
              ),
              minLines: 2,
              maxLines: 2,
              onChanged: (String value) {
                formData = formData.update(details: value);
                widget.onChangeForm(formData);
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),),
            ),
          ),
        ),
      ],
    );
  }
}

/// Экран создания нового места
class SightAddScreen extends StatefulWidget {
  @override
  _SightAddScreenState createState() => _SightAddScreenState();
}

class _SightAddScreenState extends State<SightAddScreen> {
  AddFormData formData;
  bool isValid = false;

  void _handleChangeData(AddFormData newFormData) {
    setState(() {
      // Валидация пока херовенькая. Пройдем ключи - сделаю нормально, опираясь на валидность формы
      isValid = newFormData.name != null && newFormData.lat != 0 && newFormData.lon != 0;
      formData = newFormData;
    });
  }

  void _handleSubmit() {
    if (!isValid) {
      return;
    }

    mocks.add(
      Sight(
        name: formData.name,
        lat: formData.lat,
        lon: formData.lon,
        url: 'https://',
        details: formData.details,
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
            color: Theme.of(context).textTheme.headline1.color,
          ),
        ),
        leadingWidth: 90,
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 18,
          ),
          child: GestureDetector(
            onTap: () {
              print('back');
            },
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
              Column(
                children: [
                  // CategorySelector(),
                  AddPlaceForm(
                    onChangeForm: _handleChangeData,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
