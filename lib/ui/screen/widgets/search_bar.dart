import 'package:flutter/material.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/text_field_icon_wrapper.dart';
import 'package:places/ui/screen/filters_screen.dart';

/// Прсотенький мьютекс, исполняющий только первого входящего в синхронном режиме,
/// отпускается асинхронно в микротаске
class Mutex {
  bool _taken = false;

  execute(VoidCallback cb) {
    if (_taken) {
      return;
    }
    _taken = true;
    Future.microtask(() {
      cb();
      _taken = false;
    });
  }
}

/// Виджет поиска для главного экрана, уводит на страницу поиска при клике,
/// или на фильтры при клике на иконку
class SearchBar extends StatelessWidget {
  final Mutex clickMutex = Mutex();

  OutlineInputBorder searchBarBorder(context) {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(PlacesSizes.primaryPaddingWithoutFourth),
      borderSide: BorderSide(
        width: 0,
        color: Theme.of(context).disabledColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          vertical: 6,
        ),
        child: SizedBox(
          height: PlacesSizes.textFormFieldHeight,
          child: TextFormField(
            autofocus: false,
            readOnly: true,
            onTap: () {
              clickMutex.execute(() {

              });
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).disabledColor,
              border: searchBarBorder(context),
              enabledBorder: searchBarBorder(context),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
              prefixIcon: TextFieldIconWrapper(
                child: SightIconSearch(),
              ),
              suffixIcon: InkWell(
                onTap: () {
                  clickMutex.execute(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FiltersScreen()),
                    );
                  });
                },
                child: TextFieldIconWrapper(
                  child: SightIconFilter(),
                ),
              ),
            ),
          ),
        ));
  }
}
