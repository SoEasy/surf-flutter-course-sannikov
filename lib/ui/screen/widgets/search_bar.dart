import 'package:flutter/material.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/text_field_icon_wrapper.dart';

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
class SearchBar extends StatefulWidget {
  final VoidCallback? onTap;
  final VoidCallback onInputIconTap;
  final Widget icon;
  final bool disabled;
  final TextEditingController? controller;

  SearchBar({
    required this.onInputIconTap,
    required this.icon,
    this.onTap,
    this.disabled = false,
    this.controller,
  });

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final Mutex clickMutex = Mutex();
  final FocusNode inputFocusNode = FocusNode();

  void handleInputTap() {
    clickMutex.execute(() {
      widget.onTap?.call();
    });
    if (widget.disabled || !inputFocusNode.hasPrimaryFocus) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
  }

  void handleInputIconTap() {
    clickMutex.execute(() {
      widget.onInputIconTap.call();
    });
  }

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
          readOnly: widget.disabled,
          controller: widget.controller,
          onTap: handleInputTap,
          focusNode: inputFocusNode,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).disabledColor,
            border: searchBarBorder(context),
            enabledBorder: searchBarBorder(context),
            focusedBorder: searchBarBorder(context),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 60),
            prefixIcon: TextFieldIconWrapper(
              child: SightIconSearch(),
            ),
            suffixIcon: InkWell(
              onTap: handleInputIconTap,
              child: TextFieldIconWrapper(
                child: widget.icon ?? SizedBox.shrink(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
