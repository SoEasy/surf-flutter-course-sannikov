import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/screen/add_sight_screen/types.dart';

/// Виджет для отрисовки тектсового поля с лейблом наверху
class InputWithLabel extends StatelessWidget {
  final String label;
  final Widget child;

  InputWithLabel({
    required this.label,
    required this.child,
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
            color: Theme.of(context).textTheme.subtitle2?.color,
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

/// Виджет, инкапсулирующий форму добавления нового места
class AddPlaceForm extends StatefulWidget {
  final void Function(AddFormData data) onChangeForm;

  @override
  _AddPlaceFormState createState() => _AddPlaceFormState();

  AddPlaceForm({
    required this.onChangeForm,
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
            height: PlacesSizes.textFormFieldHeight,
            child: TextFormField(
              focusNode: titleFocusNode,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) {
                _changeFocus(titleFocusNode, latFocusNode);
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                return value != null
                  ? value.length > 0 ? null : 'Invalid'
                  : null;
              },
              onChanged: (String value) {
                formData = formData.update(name: value);
                widget.onChangeForm(formData);
              },
              decoration: InputDecoration(
                errorStyle: TextStyle(height: 0),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: PlacesSizes.primaryPadding,
                ),
              ),
              style: PlacesFonts.size16.copyWith(
                color: Theme.of(context).textTheme.headline1?.color,
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
                  height: PlacesSizes.textFormFieldHeight,
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
                    validator: (String? value) {
                      return value != null && latRegExp.hasMatch(value) ? null : '';
                    },
                    onChanged: (String value) {
                      double? newValue = double.tryParse(value);
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
                      color: Theme.of(context).textTheme.headline1?.color,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: PlacesSizes.primaryPadding,
            ),
            Expanded(
              child: InputWithLabel(
                label: 'Долгота',
                child: SizedBox(
                  height: PlacesSizes.textFormFieldHeight,
                  child: TextFormField(
                    focusNode: lonFocusNode,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    onFieldSubmitted: (_) {
                      _changeFocus(lonFocusNode, detailsFocusNode);
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      return value != null && lonRegExp.hasMatch(value) ? null : '';
                    },
                    onChanged: (String value) {
                      double? newValue = double.tryParse(value);
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
                      color: Theme.of(context).textTheme.headline1?.color,
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
            height: PlacesSizes.textFormFieldHeight * 2,
            child: TextFormField(
              focusNode: detailsFocusNode,
              textInputAction: TextInputAction.done,
              style: PlacesFonts.size16.copyWith(
                color: Theme.of(context).textTheme.headline1?.color,
              ),
              minLines: 2,
              maxLines: 2,
              onChanged: (String value) {
                formData = formData.update(details: value);
                widget.onChangeForm(formData);
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: PlacesSizes.primaryPadding,
                  vertical: PlacesSizes.primaryPaddingWithoutFourth,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
